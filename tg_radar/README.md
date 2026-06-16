# TG RADAR

ИИ-мониторинг Telegram-чатов для поиска клиентов по ключевым запросам.

## Как это работает

1. Создаёте Telegram-бота (у @BotFather)
2. Отключаете privacy mode у бота (@BotFather → /setprivacy → Disable)
3. Добавляете бота в чаты, которые нужно мониторить
4. Создаёте проекты в боте с ключевыми словами (например: "ищу подрядчика", "нужен мастер")
5. Бот видит все сообщения в чатах и находит целевые запросы
6. Лиды приходят вам в того же бота

## Отличия от первой версии

**Больше не нужны** TG_API_ID и TG_API_HASH с my.telegram.org.  
Вся работа идёт через Bot API — достаточно создать бота в @BotFather.

## Установка

```bash
python3 -m venv .venv
source .venv/bin/activate
pip install -r requirements.txt
cp .env.example .env
```

## Настройка `.env`

```
BOT_TOKEN=123456:ABC-DEF1234...   # @BotFather → /newbot
ADMIN_IDS=123456789                # ваш Telegram ID (@userinfobot)
```

## Настройка бота (обязательно!)

1. @BotFather → `/mybots` → выбери бота → Bot Settings → **Group Privacy** → **Disable**
2. Добавь бота в чаты, которые хочешь мониторить (бот должен быть участником)

## Запуск

```bash
python3 main.py
```

## Команды Telegram-бота

| Команда | Описание |
|---|---|
| `/start` | Главное меню |
| `/add_project` | Создать новый проект |
| `/projects` | Список всех проектов |
| `/project_N` | Управление проектом |
| `/toggle_N` | Вкл/выкл проект |
| `/keywords_N` | Редактировать ключевые слова |
| `/stopwords_N` | Редактировать стоп-слова |
| `/addchat_N` | Добавить чат для мониторинга |
| `/delchat_N` | Удалить чат из мониторинга |
| `/delproject_N` | Удалить проект |
| `/leads` | Все лиды |
| `/leads_N` | Лиды конкретного проекта |
| `/lead_N` | Детали лида |
| `/lead_status_N_contacted` | Отметить «связался» |
| `/lead_status_N_closed` | Закрыть лид |
| `/lead_status_N_spam` | Спам |
| `/stats` | Статистика |
| `/refresh` | Обновить фильтры |
