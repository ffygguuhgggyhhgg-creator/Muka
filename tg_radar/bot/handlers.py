import logging
from typing import Optional, Any, Awaitable, Callable

from aiogram import Bot, Dispatcher, F, BaseMiddleware
from aiogram.filters import Command
from aiogram.types import Message, TelegramObject
from aiogram.enums import ChatType
from aiogram.fsm.context import FSMContext
from aiogram.fsm.state import State, StatesGroup

from config import settings
from database.db import db
from monitor.filter import build_filter

logger = logging.getLogger("tg_radar.bot")

bot: Optional[Bot] = None


class AdminMiddleware(BaseMiddleware):
    async def __call__(
        self,
        handler: Callable[[TelegramObject, dict[str, Any]], Awaitable[Any]],
        event: TelegramObject,
        data: dict[str, Any],
    ) -> Any:
        if isinstance(event, Message):
            user_id = event.from_user.id if event.from_user else None
            if user_id and user_id not in settings.admin_ids:
                await event.answer("⛔ Доступ запрещён")
                return
        return await handler(event, data)


class LeadMonitorMiddleware(BaseMiddleware):
    def __init__(self):
        self._filters = {}
        self._chat_to_projects = {}

    async def refresh(self):
        self._filters.clear()
        self._chat_to_projects.clear()
        projects = db.get_projects(only_active=True)
        for p in projects:
            mf = build_filter(p.keywords, p.stop_words)
            self._filters[p.id] = mf
            chats = db.get_source_chats(project_id=p.id, only_active=True)
            for c in chats:
                self._chat_to_projects.setdefault(c.chat_id, []).append(p.id)
        logger.info("Monitor: %d projects, %d chat mappings", len(projects), len(self._chat_to_projects))

    async def __call__(
        self,
        handler: Callable[[TelegramObject, dict[str, Any]], Awaitable[Any]],
        event: TelegramObject,
        data: dict[str, Any],
    ) -> Any:
        if not isinstance(event, Message):
            return await handler(event, data)

        message = event
        chat = message.chat

        # Only monitor groups and supergroups
        if chat.type not in (ChatType.GROUP, ChatType.SUPERGROUP):
            return await handler(event, data)

        if not message.text:
            return await handler(event, data)

        chat_id = chat.id
        project_ids = self._chat_to_projects.get(chat_id, [])

        if not project_ids:
            return await handler(event, data)

        for pid in project_ids:
            mf = self._filters.get(pid)
            if not mf:
                continue
            if not mf.is_relevant(message.text):
                continue

            project = db.get_project(pid)
            if not project:
                continue

            sender = message.from_user
            sender_id = sender.id if sender else 0
            sender_name = sender.full_name if sender and sender.full_name else ""
            username = sender.username if sender else ""
            chat_title = chat.title or chat.username or str(chat_id)
            chat_username = chat.username or ""

            sc = db.add_source_chat(
                project_id=pid,
                chat_id=chat_id,
                chat_title=chat_title,
                chat_username=chat_username,
            )

            message_link = (
                f"https://t.me/{chat_username}/{message.message_id}"
                if chat_username and message.message_id
                else f"https://t.me/c/{str(chat_id)[4:] if str(chat_id).startswith('-100') else chat_id}/{message.message_id}"
            )

            lead = db.add_lead(
                project_id=pid,
                source_chat_id=sc.id,
                sender_id=sender_id,
                sender_name=sender_name,
                username=username or "",
                message_text=message.text[:1000],
                message_id=message.message_id or 0,
                chat_title=chat_title,
                message_link=message_link,
            )

            if lead:
                logger.info("Lead! Project=%s Chat=%s User=%s",
                            project.name, chat_title, sender_name or username)
                await self._notify(lead, project)

        return await handler(event, data)

    async def _notify(self, lead, project):
        if not bot:
            return
        for admin_id in settings.admin_ids:
            try:
                text = (
                    f"🎯 <b>Новый лид!</b>\n"
                    f"━━━━━━━━━━━━━━\n"
                    f"📁 Проект: <b>{project.name}</b>\n"
                    f"💬 Чат: <b>{lead.chat_title}</b>\n"
                    f"👤 Отправитель: {lead.sender_name}"
                    f"{' (@' + lead.username + ')' if lead.username else ''}\n"
                    f"📝 Сообщение:\n"
                    f"<blockquote>{lead.message_text[:400]}</blockquote>\n"
                    f"🔗 <a href='{lead.message_link}'>Перейти к сообщению</a>\n"
                    f"━━━━━━━━━━━━━━\n"
                    f"<code>/lead_{lead.id}</code> — подробнее"
                )
                await bot.send_message(admin_id, text, parse_mode="HTML")
            except Exception as e:
                logger.error("Failed to notify admin %d: %s", admin_id, e)


lead_monitor = LeadMonitorMiddleware()


class ProjectCreate(StatesGroup):
    name = State()
    keywords = State()
    stop_words = State()


class ProjectEditKeywords(StatesGroup):
    waiting = State()


class ProjectEditStopWords(StatesGroup):
    waiting = State()


class ProjectAddChat(StatesGroup):
    waiting = State()


class ProjectDelChat(StatesGroup):
    waiting = State()


async def cmd_start(message: Message):
    unread = db.get_unread_leads_count()
    stats = db.get_stats()
    projects = db.get_projects()

    text = (
        f"👋 <b>TG RADAR</b>\n"
        f"━━━━━━━━━━━━━━\n"
        f"📁 Проектов: <b>{len(projects)}</b>\n"
        f"📬 Непрочитанных лидов: <b>{unread}</b>\n"
        f"📊 Всего лидов: <b>{stats['total_leads']}</b>\n"
        f"📅 За сегодня: <b>{stats['today']}</b>\n"
        f"━━━━━━━━━━━━━━\n\n"
        f"<b>Команды:</b>\n"
        f"/projects — управление проектами\n"
        f"/leads — лиды\n"
        f"/stats — статистика\n"
        f"/add_project — новый проект\n"
        f"/refresh — обновить фильтры"
    )
    await message.answer(text, parse_mode="HTML")


async def cmd_projects(message: Message):
    projects = db.get_projects()
    if not projects:
        await message.answer("📁 Проектов пока нет. Создай: /add_project")
        return

    lines = ["📁 <b>Мои проекты</b>\n"]
    for p in projects:
        status = "🟢" if p.is_active else "🔴"
        unread = db.get_unread_leads_count(project_id=p.id)
        lines.append(
            f"{status} <b>{p.name}</b>\n"
            f"   ├ Ключевых слов: {len(p.keywords)}\n"
            f"   ├ Стоп-слов: {len(p.stop_words)}\n"
            f"   ├ Непрочитано: {unread}\n"
            f"   └ /project_{p.id}\n"
        )
    await message.answer("\n".join(lines), parse_mode="HTML")


async def cmd_project_detail(message: Message):
    project_id = int(message.text.split("_")[1])
    project = db.get_project(project_id)
    if not project:
        await message.answer("❌ Проект не найден")
        return

    chats = db.get_source_chats(project_id=project_id)
    unread = db.get_unread_leads_count(project_id=project_id)
    status = "🟢 Активен" if project.is_active else "🔴 Остановлен"

    lines = [
        f"📁 <b>{project.name}</b>\n",
        f"<b>Статус:</b> {status}",
        f"<b>Непрочитано:</b> {unread}\n",
        f"<b>Ключевые слова:</b>\n",
    ]
    if project.keywords:
        lines.append("   " + ", ".join(f"<code>{kw}</code>" for kw in project.keywords))
    else:
        lines.append("   <i>не заданы</i>")
    lines.append("")
    lines.append("<b>Стоп-слова:</b>")
    if project.stop_words:
        lines.append("   " + ", ".join(f"<code>{sw}</code>" for sw in project.stop_words))
    else:
        lines.append("   <i>не заданы</i>")
    lines.append("")
    lines.append(f"<b>Чаты для мониторинга ({len(chats)}):</b>")
    if chats:
        for c in chats:
            ch = "🟢" if c.is_active else "🔴"
            lines.append(f"   {ch} {c.chat_title} (<code>{c.chat_id}</code>)")
    else:
        lines.append("   <i>не добавлены</i>")

    lines.extend([
        "",
        "━━━━━━━━━━━━━━",
        f"/toggle_{project_id} — вкл/выкл",
        f"/keywords_{project_id} — изменить ключевые слова",
        f"/stopwords_{project_id} — изменить стоп-слова",
        f"/addchat_{project_id} — добавить чат",
        f"/delchat_{project_id} — удалить чат",
        f"/leads_{project_id} — лиды проекта",
        f"/delproject_{project_id} — удалить проект",
    ])
    await message.answer("\n".join(lines), parse_mode="HTML")


async def cmd_add_project_start(message: Message, state: FSMContext):
    await message.answer(
        "📁 <b>Новый проект</b>\n\n"
        "Введите название проекта:",
        parse_mode="HTML"
    )
    await state.set_state(ProjectCreate.name)


async def cmd_add_project_name(message: Message, state: FSMContext):
    name = message.text.strip()
    if not name:
        await message.answer("❌ Название не может быть пустым")
        return
    await state.update_data(name=name)
    await message.answer(
        f"📁 Проект <b>{name}</b>\n\n"
        "Введите <b>ключевые слова</b> через запятую.\n"
        "Их будет искать мониторинг в сообщениях.\n\n"
        "Пример: <code>ищу подрядчика, нужен мастер, требуется специалист, "
        "посоветуйте, кто может, ремонт квартиры, настройка рекламы</code>",
        parse_mode="HTML"
    )
    await state.set_state(ProjectCreate.keywords)


async def cmd_add_project_keywords(message: Message, state: FSMContext):
    keywords = [kw.strip() for kw in message.text.split(",") if kw.strip()]
    if not keywords:
        await message.answer("❌ Нужно хотя бы одно ключевое слово")
        return
    await state.update_data(keywords=keywords)
    await message.answer(
        "✅ Ключевые слова сохранены!\n\n"
        "Теперь введите <b>стоп-слова</b> через запятую.\n"
        "Сообщения с ними будут <b>игнорироваться</b>.\n\n"
        "Пример: <code>продаю, куплю, отдам, работа, вакансия, "
        "резюме, предлагаю свои услуги</code>\n\n"
        "Или отправьте <code>пропустить</code>",
        parse_mode="HTML"
    )
    await state.set_state(ProjectCreate.stop_words)


async def cmd_add_project_stop_words(message: Message, state: FSMContext):
    data = await state.get_data()
    stop_words = []
    if message.text.lower().strip() != "пропустить":
        stop_words = [sw.strip() for sw in message.text.split(",") if sw.strip()]

    project = db.create_project(
        name=data["name"],
        keywords=data["keywords"],
        stop_words=stop_words,
    )
    await state.clear()
    await message.answer(
        f"✅ Проект <b>{project.name}</b> создан!\n\n"
        f"Ключевых слов: {len(project.keywords)}\n"
        f"Стоп-слов: {len(project.stop_words)}\n\n"
        f"Теперь добавь чаты для мониторинга:\n"
        f"/addchat_{project.id}\n"
        f"Бот должен быть добавлен в чат и иметь отключенный privacy mode "
        f"(у @BotFather → /setprivacy → Disable)",
        parse_mode="HTML"
    )


async def cmd_toggle_project(message: Message):
    project_id = int(message.text.split("_")[1])
    project = db.get_project(project_id)
    if not project:
        await message.answer("❌ Проект не найден")
        return
    db.update_project(project_id, is_active=not project.is_active)
    new_status = "🟢 активирован" if not project.is_active else "🔴 остановлен"
    await message.answer(f"Проект <b>{project.name}</b> {new_status}", parse_mode="HTML")


async def cmd_edit_keywords_start(message: Message, state: FSMContext):
    project_id = int(message.text.split("_")[1])
    project = db.get_project(project_id)
    if not project:
        await message.answer("❌ Проект не найден")
        return
    await state.update_data(project_id=project_id)
    current = ", ".join(project.keywords) if project.keywords else "не заданы"
    await message.answer(
        f"📝 Ключевые слова для <b>{project.name}</b>\n"
        f"Текущие: <code>{current}</code>\n\n"
        f"Введите новые ключевые слова через запятую:",
        parse_mode="HTML"
    )
    await state.set_state(ProjectEditKeywords.waiting)


async def cmd_edit_keywords_save(message: Message, state: FSMContext):
    data = await state.get_data()
    project_id = data["project_id"]
    keywords = [kw.strip() for kw in message.text.split(",") if kw.strip()]
    if not keywords:
        await message.answer("❌ Нужно хотя бы одно ключевое слово")
        return
    db.update_project(project_id, keywords=keywords)
    await state.clear()
    await message.answer("✅ Ключевые слова обновлены!")


async def cmd_edit_stopwords_start(message: Message, state: FSMContext):
    project_id = int(message.text.split("_")[1])
    project = db.get_project(project_id)
    if not project:
        await message.answer("❌ Проект не найден")
        return
    await state.update_data(project_id=project_id)
    current = ", ".join(project.stop_words) if project.stop_words else "не заданы"
    await message.answer(
        f"📝 Стоп-слова для <b>{project.name}</b>\n"
        f"Текущие: <code>{current}</code>\n\n"
        f"Введите новые стоп-слова через запятую\n"
        f"Или <code>пропустить</code> чтобы очистить:",
        parse_mode="HTML"
    )
    await state.set_state(ProjectEditStopWords.waiting)


async def cmd_edit_stopwords_save(message: Message, state: FSMContext):
    data = await state.get_data()
    project_id = data["project_id"]
    stop_words = []
    if message.text.lower().strip() != "пропустить":
        stop_words = [sw.strip() for sw in message.text.split(",") if sw.strip()]
    db.update_project(project_id, stop_words=stop_words)
    await state.clear()
    await message.answer("✅ Стоп-слова обновлены!")


async def cmd_add_chat_start(message: Message, state: FSMContext):
    project_id = int(message.text.split("_")[1])
    project = db.get_project(project_id)
    if not project:
        await message.answer("❌ Проект не найден")
        return
    await state.update_data(project_id=project_id)
    await message.answer(
        f"💬 Добавление чата для <b>{project.name}</b>\n\n"
        "Добавь бота в нужный чат, а затем отправь мне любое "
        "сообщение из этого чата (перешли) или ID чата.\n\n"
        "Как получить ID чата:\n"
        "1. Добавь бота <b>@userinfobot</b> в чат\n"
        "2. Напиши <code>/id</code>\n\n"
        "Либо просто перешли любое сообщение из чата сюда — "
        "я сам пойму ID.",
        parse_mode="HTML"
    )
    await state.set_state(ProjectAddChat.waiting)


async def cmd_add_chat_save(message: Message, state: FSMContext):
    data = await state.get_data()
    project_id = data["project_id"]
    text = message.text.strip()

    chat_id = None
    chat_title = ""
    chat_username = ""

    # If message is forwarded from a group
    if message.forward_from_chat:
        chat_id = message.forward_from_chat.id
        chat_title = message.forward_from_chat.title or ""
        chat_username = message.forward_from_chat.username or ""
    elif text.lstrip("-").isdigit():
        chat_id = int(text)
    else:
        await message.answer(
            "❌ Не могу определить чат.\n"
            "Перешли сообщение из нужного чата или отправь ID чата числом.\n"
            "Как узнать ID: @userinfobot"
        )
        return

    db.add_source_chat(
        project_id=project_id,
        chat_id=chat_id,
        chat_title=chat_title or str(chat_id),
        chat_username=chat_username,
    )

    await state.clear()
    lead_monitor.refresh()
    await message.answer(
        f"✅ Чат добавлен!\n\n"
        f"<b>Важно:</b> убедись, что бот добавлен в этот чат "
        f"и у него отключен privacy mode:\n"
        f"@BotFather → /setprivacy → Disable",
        parse_mode="HTML"
    )


async def cmd_del_chat_start(message: Message, state: FSMContext):
    project_id = int(message.text.split("_")[1])
    project = db.get_project(project_id)
    if not project:
        await message.answer("❌ Проект не найден")
        return

    chats = db.get_source_chats(project_id=project_id)
    if not chats:
        await message.answer("Нет чатов для удаления")
        return

    await state.update_data(project_id=project_id, chats={str(i): c.id for i, c in enumerate(chats, 1)})

    lines = [f"💬 <b>Чаты проекта {project.name}</b>\nВыберите номер для удаления:",
             "━━━━━━━━━━━━━━"]
    for i, c in enumerate(chats, 1):
        lines.append(f"{i}. {c.chat_title} (<code>{c.chat_id}</code>)")
    lines.append("━━━━━━━━━━━━━━")
    lines.append("Напишите номер чата или /cancel")
    await message.answer("\n".join(lines), parse_mode="HTML")
    await state.set_state(ProjectDelChat.waiting)


async def cmd_del_chat_confirm(message: Message, state: FSMContext):
    if message.text.strip() == "/cancel":
        await state.clear()
        await message.answer("❌ Отменено")
        return

    data = await state.get_data()
    chats = data.get("chats", {})
    idx = message.text.strip()
    if idx not in chats:
        await message.answer("❌ Неверный номер. Попробуйте ещё раз или /cancel")
        return

    chat_db_id = chats[idx]
    db.remove_source_chat(chat_db_id)
    await state.clear()
    lead_monitor.refresh()
    await message.answer("✅ Чат удалён из проекта")


async def cmd_delete_project(message: Message):
    project_id = int(message.text.split("_")[1])
    project = db.get_project(project_id)
    if not project:
        await message.answer("❌ Проект не найден")
        return
    db.delete_project(project_id)
    lead_monitor.refresh()
    await message.answer(f"🗑 Проект <b>{project.name}</b> удалён", parse_mode="HTML")


async def cmd_leads(message: Message):
    parts = message.text.split("_")
    project_id = None
    if len(parts) >= 2 and parts[1].isdigit():
        project_id = int(parts[1])

    if project_id:
        project = db.get_project(project_id)
        if not project:
            await message.answer("❌ Проект не найден")
            return
        leads = db.get_leads(project_id=project_id, limit=10)
        title = f"📬 Лиды: <b>{project.name}</b>"
    else:
        leads = db.get_leads(limit=20)
        title = "📬 Последние лиды"

    if not leads:
        await message.answer(f"{title}\n\n<i>Пока нет лидов</i>", parse_mode="HTML")
        return

    lines = [title, "━━━━━━━━━━━━━━"]
    for lead in leads:
        status_icon = {"new": "🆕", "contacted": "📞", "closed": "✅", "spam": "🚫"}.get(lead.status, "🆕")
        read_icon = "👁" if lead.is_read else "🔵"
        lines.append(
            f"{status_icon} {read_icon} <b>{lead.sender_name or 'unknown'}</b>\n"
            f"   📁 {lead.project_id} | 💬 {lead.chat_title}\n"
            f"   📝 {lead.message_text[:100]}{'...' if len(lead.message_text) > 100 else ''}\n"
            f"   └ /lead_{lead.id}\n"
        )
    lines.append("━━━━━━━━━━━━━━")
    lines.append("Подробнее: /lead_ID")
    await message.answer("\n".join(lines), parse_mode="HTML")


async def cmd_lead_detail(message: Message):
    lead_id = int(message.text.split("_")[1])
    lead = db.get_lead(lead_id)
    if not lead:
        await message.answer("❌ Лид не найден")
        return

    project = db.get_project(lead.project_id)
    project_name = project.name if project else "unknown"

    status_emoji = {"new": "🆕", "contacted": "📞", "closed": "✅", "spam": "🚫"}.get(lead.status, "🆕")

    username_line = f"📧 Username: @{lead.username}\n" if lead.username else ""
    link_line = f"🔗 <a href='{lead.message_link}'>Перейти к сообщению</a>\n" if lead.message_link else ""

    text = (
        f"{status_emoji} <b>Лид #{lead.id}</b>\n"
        f"━━━━━━━━━━━━━━\n"
        f"📁 Проект: <b>{project_name}</b>\n"
        f"💬 Чат: <b>{lead.chat_title}</b>\n"
        f"👤 Имя: <b>{lead.sender_name}</b>\n"
        f"🆔 ID: <code>{lead.sender_id}</code>\n"
        f"{username_line}"
        f"📅 Когда: {lead.created_at[:19].replace('T', ' ')}\n"
        f"📊 Статус: <b>{lead.status}</b>\n"
        f"━━━━━━━━━━━━━━\n"
        f"<b>Сообщение:</b>\n"
        f"{lead.message_text}\n"
        f"━━━━━━━━━━━━━━\n"
        f"{link_line}"
        f"\n"
        f"/lead_status_{lead.id}_contacted — связался\n"
        f"/lead_status_{lead.id}_closed — закрыто\n"
        f"/lead_status_{lead.id}_spam — спам"
    )
    await message.answer(text, parse_mode="HTML")
    db.update_lead(lead_id, is_read=True)


async def cmd_lead_status(message: Message):
    parts = message.text.split("_")
    if len(parts) < 4 or not parts[2].isdigit():
        return
    lead_id = int(parts[2])
    status = parts[3]

    if status not in ("contacted", "closed", "spam"):
        await message.answer("❌ Неверный статус")
        return

    db.update_lead(lead_id, status=status)
    if status == "contacted":
        db.update_lead(lead_id, is_contacted=True)

    await message.answer(f"✅ Лид #{lead_id} отмечен как <b>{status}</b>", parse_mode="HTML")


async def cmd_stats(message: Message):
    stats = db.get_stats()
    projects = db.get_projects()
    text = (
        f"📊 <b>Статистика</b>\n"
        f"━━━━━━━━━━━━━━\n"
        f"📁 Проектов: <b>{len(projects)}</b>\n"
        f"📬 Всего лидов: <b>{stats['total_leads']}</b>\n"
        f"🔵 Непрочитано: <b>{stats['unread']}</b>\n"
        f"📅 За сегодня: <b>{stats['today']}</b>\n"
        f"📞 Связались: <b>{stats['contacted']}</b>\n"
        f"💬 Активных чатов: <b>{stats['active_chats']}</b>"
    )
    await message.answer(text, parse_mode="HTML")


async def cmd_refresh(message: Message):
    lead_monitor.refresh()
    await message.answer("🔄 Фильтры монитора обновлены!")


def register_handlers(dp: Dispatcher):
    dp.message.middleware(AdminMiddleware())
    dp.message.middleware(lead_monitor)

    dp.message.register(cmd_start, Command("start"))
    dp.message.register(cmd_projects, Command("projects"))
    dp.message.register(cmd_stats, Command("stats"))
    dp.message.register(cmd_refresh, Command("refresh"))
    dp.message.register(cmd_leads, Command("leads"))
    dp.message.register(cmd_add_project_start, Command("add_project"))

    regex_map = {
        r"^/project_\d+$": cmd_project_detail,
        r"^/toggle_\d+$": cmd_toggle_project,
        r"^/keywords_\d+$": cmd_edit_keywords_start,
        r"^/stopwords_\d+$": cmd_edit_stopwords_start,
        r"^/addchat_\d+$": cmd_add_chat_start,
        r"^/delchat_\d+$": cmd_del_chat_start,
        r"^/delproject_\d+$": cmd_delete_project,
        r"^/lead_\d+$": cmd_lead_detail,
        r"^/lead_status_\d+_(contacted|closed|spam)$": cmd_lead_status,
        r"^/leads_\d+$": cmd_leads,
    }
    for pattern, handler in regex_map.items():
        dp.message.register(handler, F.text.regex(pattern))

    dp.message.register(cmd_add_project_name, ProjectCreate.name)
    dp.message.register(cmd_add_project_keywords, ProjectCreate.keywords)
    dp.message.register(cmd_add_project_stop_words, ProjectCreate.stop_words)

    dp.message.register(cmd_edit_keywords_save, ProjectEditKeywords.waiting)
    dp.message.register(cmd_edit_stopwords_save, ProjectEditStopWords.waiting)
    dp.message.register(cmd_add_chat_save, ProjectAddChat.waiting)
    dp.message.register(cmd_del_chat_confirm, ProjectDelChat.waiting)
