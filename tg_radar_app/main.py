import json
import logging
import os
import sys

from kivy.app import App
from kivy.clock import Clock
from kivy.uix.boxlayout import BoxLayout
from kivy.uix.button import Button
from kivy.uix.label import Label
from kivy.uix.popup import Popup
from kivy.uix.scrollview import ScrollView
from kivy.uix.textinput import TextInput
from kivy.uix.tabbedpanel import TabbedPanel, TabbedPanelItem

from database import Database
from bot_worker import BotWorker

logging.basicConfig(level=logging.DEBUG)
logger = logging.getLogger("tg_radar")


DB_PATH = os.path.join(os.environ.get("ANDROID_PRIVATE", "."), "radar.db")


def colored(text, color="#ffffff"):
    return f"[color={color}]{text}[/color]"


class TGRadarApp(App):
    def __init__(self):
        super().__init__()
        self.db = Database(DB_PATH)
        self.bot = BotWorker(
            self.db,
            on_lead_callback=self.on_new_lead,
            on_log_callback=self.on_bot_log,
        )

    def build(self):
        self.title = "TG RADAR"
        self.root = BoxLayout(orientation="vertical", spacing=5, padding=10)

        if not self.bot.is_configured():
            self._show_setup()
        else:
            self._show_main()

        return self.root

    def _clear(self):
        self.root.clear_widgets()

    def _show_setup(self):
        self._clear()
        layout = BoxLayout(orientation="vertical", spacing=10, padding=20)

        layout.add_widget(Label(text="TG RADAR", font_size="24sp", bold=True))
        layout.add_widget(Label(text="Настройка", font_size="18sp"))

        layout.add_widget(Label(text="Bot Token (от @BotFather):", halign="left"))
        token_input = TextInput(
            text=self.db.get_config("bot_token", ""),
            multiline=False, hint_text="123456:ABC-DEF..."
        )
        layout.add_widget(token_input)

        layout.add_widget(Label(text="Admin IDs (через запятую):", halign="left"))
        admin_input = TextInput(
            text=self.db.get_config("admin_ids", "").replace("[", "").replace("]", "").replace('"', ""),
            multiline=False, hint_text="123456789"
        )
        layout.add_widget(admin_input)

        def save_cb(btn):
            token = token_input.text.strip()
            ids_str = admin_input.text.strip()
            if not token or not ids_str:
                self._popup("Ошибка", "Заполни оба поля")
                return
            try:
                admin_ids = [int(x.strip()) for x in ids_str.split(",") if x.strip().isdigit()]
            except ValueError:
                self._popup("Ошибка", "ID должны быть числами")
                return
            self.bot.configure(token, admin_ids)
            self._show_main()

        layout.add_widget(Button(text="Сохранить", size_hint_y=0.15, on_press=save_cb))

        scroll = ScrollView()
        scroll.add_widget(layout)
        self.root.add_widget(scroll)

    def _show_main(self):
        self._clear()
        panel = TabbedPanel(do_default_tab=False)

        panel.add_widget(self._make_main_tab())
        panel.add_widget(self._make_projects_tab())
        panel.add_widget(self._make_leads_tab())
        panel.add_widget(self._make_log_tab())

        self.root.add_widget(panel)

    def _make_main_tab(self):
        tab = TabbedPanelItem(text="Главная")
        layout = BoxLayout(orientation="vertical", spacing=10, padding=10)

        self.status_label = Label(
            text="🟢 Запущен" if self.bot.running else "🔴 Остановлен",
            font_size="20sp", bold=True
        )
        layout.add_widget(self.status_label)

        self.stats_label = Label(
            text=self._get_stats_text(),
            font_size="14sp", halign="left", valign="top"
        )
        self.stats_label.bind(size=self.stats_label.setter("text_size"))
        layout.add_widget(self.stats_label)

        btn_layout = BoxLayout(orientation="horizontal", spacing=10, size_hint_y=0.15)

        self.start_btn = Button(
            text="⏹ Остановить" if self.bot.running else "▶ Запустить"
        )
        self.start_btn.bind(on_press=self._toggle_bot)
        btn_layout.add_widget(self.start_btn)

        btn_layout.add_widget(Button(
            text="⚙ Настройки", on_press=lambda x: self._show_setup()
        ))

        layout.add_widget(btn_layout)
        tab.add_widget(layout)
        return tab

    def _toggle_bot(self, btn):
        if self.bot.running:
            self.bot.stop()
        else:
            self.bot.start()
        Clock.schedule_once(lambda dt: self._refresh_ui(), 0.1)

    def _refresh_ui(self):
        if hasattr(self, "status_label"):
            self.status_label.text = "🟢 Запущен" if self.bot.running else "🔴 Остановлен"
        if hasattr(self, "start_btn"):
            self.start_btn.text = "⏹ Остановить" if self.bot.running else "▶ Запустить"
        if hasattr(self, "stats_label"):
            self.stats_label.text = self._get_stats_text()

    def _get_stats_text(self):
        stats = self.db.get_stats()
        projects = self.db.get_projects()
        lines = [
            f"📁 Проектов: {len(projects)}",
            f"📬 Всего лидов: {stats['total']}",
            f"🔵 Непрочитано: {stats['unread']}",
        ]
        if self.bot.running:
            lines.append(f"\n✅ Бот работает")
        else:
            lines.append(f"\n❌ Бот остановлен")
        return "\n".join(lines)

    def _make_projects_tab(self):
        tab = TabbedPanelItem(text="Проекты")
        layout = BoxLayout(orientation="vertical", spacing=5, padding=5)

        self.projects_list = ScrollView()
        self._update_projects_list()
        layout.add_widget(self.projects_list)

        layout.add_widget(Button(
            text="+ Добавить проект", size_hint_y=0.1,
            on_press=lambda x: self._show_add_project()
        ))
        layout.add_widget(Button(
            text="🔄 Обновить", size_hint_y=0.08,
            on_press=lambda x: self._update_projects_list()
        ))

        tab.add_widget(layout)
        return tab

    def _update_projects_list(self, *args):
        projects = self.db.get_projects()
        layout = BoxLayout(orientation="vertical", spacing=5, size_hint_y=None)
        layout.bind(minimum_height=layout.setter("height"))

        if not projects:
            layout.add_widget(Label(text="Нет проектов\nДобавьте через +", size_hint_y=None, height=60))
        else:
            for p in projects:
                card = BoxLayout(orientation="horizontal", size_hint_y=None, height=60)
                kw = json.loads(p.get("keywords", "[]"))
                status = "🟢" if p["is_active"] else "🔴"
                label = Label(
                    text=f"{status} {p['name']} ({len(kw)} ключевых слов)",
                    halign="left", valign="middle"
                )
                label.bind(size=label.setter("text_size"))
                card.add_widget(label)

                btn = Button(text="...", size_hint_x=0.2)
                btn.bind(on_press=lambda x, pid=p["id"]: self._show_project_detail(pid))
                card.add_widget(btn)

                layout.add_widget(card)

        self.projects_list.clear_widgets()
        self.projects_list.add_widget(layout)

    def _show_add_project(self):
        layout = BoxLayout(orientation="vertical", spacing=10, padding=20)
        layout.add_widget(Label(text="Новый проект", font_size="18sp", bold=True))

        layout.add_widget(Label(text="Название:"))
        name_inp = TextInput(multiline=False)
        layout.add_widget(name_inp)

        layout.add_widget(Label(text="Ключевые слова (через запятую):"))
        kw_inp = TextInput(hint_text="ищу, нужен, посоветуйте")
        layout.add_widget(kw_inp)

        layout.add_widget(Label(text="Стоп-слова (через запятую):"))
        sw_inp = TextInput(hint_text="продаю, отдам (или оставь пустым)")
        layout.add_widget(sw_inp)

        def save(btn):
            name = name_inp.text.strip()
            if not name:
                self._popup("Ошибка", "Введите название")
                return
            keywords = [x.strip() for x in kw_inp.text.split(",") if x.strip()]
            stop_words = [x.strip() for x in sw_inp.text.split(",") if x.strip()]
            self.db.create_project(name, keywords, stop_words)
            self._popup("Готово", f"Проект '{name}' создан")
            self._update_projects_list()
            popup.dismiss()

        layout.add_widget(Button(text="Создать", on_press=save))
        layout.add_widget(Button(text="Отмена", on_press=lambda x: popup.dismiss()))

        popup = Popup(title="Новый проект", content=layout, size_hint=(0.9, 0.8))
        popup.open()

    def _show_project_detail(self, pid):
        p = self.db.get_project(pid)
        if not p:
            return
        keywords = json.loads(p.get("keywords", "[]"))
        stop_words = json.loads(p.get("stop_words", "[]"))
        chats = self.db.get_source_chats(project_id=pid)
        stats = self.db.get_stats(project_id=pid)

        layout = BoxLayout(orientation="vertical", spacing=5, padding=10)
        status = "🟢 Активен" if p["is_active"] else "🔴 Остановлен"

        lines = [
            f"[b]{p['name']}[/b]",
            f"{status}",
            f"Ключевых слов: {len(keywords)}",
            f"Стоп-слов: {len(stop_words)}",
            f"Чатов: {len(chats)}",
            f"Лидов: {stats['total']} (непрочитано: {stats['unread']})",
            "",
            f"[b]Ключевые слова:[/b]",
        ]
        if keywords:
            lines.append(", ".join(keywords))
        else:
            lines.append("(не заданы)")
        lines.append("")
        lines.append("[b]Чаты мониторинга:[/b]")
        if chats:
            for c in chats:
                lines.append(f"  ID: {c['chat_id']} — {c['chat_title']}")
        else:
            lines.append("(не добавлены)")

        label = Label(text="\n".join(lines), markup=True, halign="left", valign="top")
        label.bind(size=label.setter("text_size"))
        layout.add_widget(label)

        btn_layout = BoxLayout(orientation="horizontal", spacing=5, size_hint_y=0.15)

        def toggle(btn):
            self.db.update_project(pid, is_active=not p["is_active"])
            p["is_active"] = not p["is_active"]
            popup.dismiss()
            self._show_project_detail(pid)

        btn_layout.add_widget(Button(
            text="▶ Вкл / Выкл" if p["is_active"] else "⏸ Вкл / Выкл",
            on_press=toggle
        ))

        def del_proj(btn):
            self.db.delete_project(pid)
            self._update_projects_list()
            popup.dismiss()

        btn_layout.add_widget(Button(text="🗑 Удалить", on_press=del_proj))
        layout.add_widget(btn_layout)

        popup = Popup(title="Проект", content=layout, size_hint=(0.9, 0.8))
        popup.open()

    def _make_leads_tab(self):
        tab = TabbedPanelItem(text="Лиды")
        layout = BoxLayout(orientation="vertical", spacing=5, padding=5)

        self.leads_list = ScrollView()
        self._update_leads_list()
        layout.add_widget(self.leads_list)

        layout.add_widget(Button(
            text="🔄 Обновить", size_hint_y=0.08,
            on_press=self._update_leads_list
        ))

        tab.add_widget(layout)
        return tab

    def _update_leads_list(self, *args):
        leads = self.db.get_leads(limit=30)
        layout = BoxLayout(orientation="vertical", spacing=5, size_hint_y=None)
        layout.bind(minimum_height=layout.setter("height"))

        if not leads:
            layout.add_widget(Label(text="Пока нет лидов", size_hint_y=None, height=60))
        else:
            for lead in leads:
                card = BoxLayout(orientation="vertical", size_hint_y=None, height=80)
                status = {"new": "🆕", "contacted": "📞", "closed": "✅", "spam": "🚫"} \
                    .get(lead.get("status", ""), "🆕")
                text = (
                    f"{status} [b]{lead.get('sender_name', 'unknown')}[/b]\n"
                    f"📝 {lead.get('message_text', '')[:100]}"
                )
                label = Label(text=text, markup=True, halign="left", valign="top")
                label.bind(size=label.setter("text_size"))
                card.add_widget(label)
                layout.add_widget(card)

        self.leads_list.clear_widgets()
        self.leads_list.add_widget(layout)

    def _make_log_tab(self):
        tab = TabbedPanelItem(text="Лог")
        layout = BoxLayout(orientation="vertical", spacing=5, padding=5)

        self.log_text = Label(
            text="Лог бота...",
            halign="left", valign="top", font_size="12sp"
        )
        self.log_text.bind(size=self.log_text.setter("text_size"))

        scroll = ScrollView()
        scroll.add_widget(self.log_text)
        layout.add_widget(scroll)

        tab.add_widget(layout)
        return tab

    def on_bot_log(self, msg):
        Clock.schedule_once(lambda dt: self._append_log(msg))

    def _append_log(self, msg):
        if hasattr(self, "log_text"):
            current = self.log_text.text
            lines = current.split("\n")
            lines.append(msg)
            if len(lines) > 100:
                lines = lines[-100:]
            self.log_text.text = "\n".join(lines)

    def on_new_lead(self, project, lead):
        Clock.schedule_once(lambda dt: self._refresh_ui())

    def _popup(self, title, text):
        layout = BoxLayout(orientation="vertical", padding=20)
        layout.add_widget(Label(text=text))
        popup = Popup(title=title, content=layout, size_hint=(0.8, 0.4))
        layout.add_widget(Button(text="OK", on_press=lambda x: popup.dismiss()))
        popup.open()

    def on_stop(self):
        self.bot.stop()


if __name__ == "__main__":
    TGRadarApp().run()
