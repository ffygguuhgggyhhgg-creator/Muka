# Handoff для Claude Fable 5

## Общий контекст

Все 4 проекта принадлежат **ООО "ТД Шихобалова"** (Самара, мукомольное производство, ~9000 т/мес).
**Текущая ситуация (июнь 2026):** Технологическая пауза с 8 июня по ~1 июля. Активный парсинг лидов для заполнения портфеля заказов на июль-сентябрь. Цель — долгосрочные контракты от 500+ т/мес.

---

## 1. tg_radar (aiogram bot) — `/tmp/opencode/tg_radar/`

**Статус:** ✅ Завершён. Рабочий production-бот.

**Стек:** Python 3.12, aiogram 3.14+, SQLite, pydantic-settings, systemd

**Структура:**
- `main.py` — точка входа, создаёт Bot/Dispatcher, запускает polling
- `config.py` — настройки из .env (BOT_TOKEN, ADMIN_IDS, DATABASE_URL)
- `bot/handlers.py` (670 строк) — все хендлеры: админ-фильтр, мониторинг групп, FSM для проектов, команды /start /projects /add_project /toggle /keywords /addchat /delchat /leads /lead_status /stats /refresh
- `monitor/filter.py` — MessageFilter (регистронезависимый поиск, стоп-слова)
- `database/db.py` (375 строк) — SQLite, полный CRUD для проектов, чатов, лидов, дедупликация
- `database/models.py` — data-классы Project, SourceChat, Lead
- `data/radar.db` — существующая БД с данными
- `tg_radar.service` — systemd unit

**Что сделано:** Проект проверен, всё готово к эксплуатации. Изменений не требовалось.

---

## 2. tg_radar_app (Kivy Android) — `/tmp/opencode/tg_radar_app/`

**Статус:** ✅ Базовый функционал готов, баги исправлены.

**Стек:** Python 3, Kivy, Buildozer (Android), requests, SQLite

**Структура:**
- `main.py` (398 строк) — Kivy-приложение: вкладки (Главная, Проекты, Лиды, Лог)
- `bot_worker.py` (202 строки) — BotWorker: long-polling Telegram API, MessageFilter, уведомления админам
- `database.py` (265 строк) — SQLite: таблицы projects, source_chats, leads, config

**Исправленные баги:**
- `bot_worker.py:197-200` — Был баг: после создания лида код брал `get_leads(limit=1)[0]` (первый в списке, не обязательно тот же). Исправлено на `get_lead(lid)` — запрос конкретного лида по возвращённому ID.
- В `database.py` добавлен метод `get_lead(lid)`.

**Что осталось (некритично, можно улучшить):**
- Заменить `requests` на `aiohttp` для асинхронности
- Добавить уведомления (Android notifications) при новых лидах
- Добавить тёмную тему
- Добавить экспорт лидов в CSV
- Улучшить UI/UX (сейчас минималистичный Kivy)

---

## 3. flourradar (PWA + Capacitor) — `/tmp/opencode/flourradar/`

**Статус:** 🔶 Mock-данные заменены на API-слой, но бэкенда нет.

**Стек:** React 19.2, TypeScript 6.0, Vite 8.0, Tailwind 4.3, Capacitor 8.4, Zustand 5, Recharts 3.8

**Структура:**
- `src/store.ts` — Zustand store с init(), localStorage persist, API fallback
- `src/services/api.ts` — API-слой с мок-фолбэком и флагом `useApi`
- `src/types.ts` — TypeScript-типы (Product, Lead, Client, AnalyticsData, AppSettings)
- `src/pages/` — Dashboard, FlourRadar(лиды), Catalog, Analytics, Clients, Settings
- `android/` — Capacitor Android проект (appId: com.tdshikhabalova.flourradar)

**Что сделано:**
- Удалён мёртвый код: `App.css`, `assets/hero.png`, `assets/react.svg`, `assets/vite.svg`
- Исправлен `public/manifest.json` — иконки теперь ссылаются на существующий `icon.svg`
- Добавлен API-слой `src/services/api.ts`:
  - `BASE_URL` из `VITE_API_URL` или `http://localhost:8000`
  - Флаг `useApi` (пока false — все запросы падают на мок-данные)
  - Функции: `fetchLeads()`, `fetchClients()`, `fetchProducts()`, `fetchAnalytics()`, `updateLeadStatus()`, `updateSettings()`
  - Каждая функция при ошибке возвращает мок-данные (graceful degradation)
- Zustand store обновлён:
  - `init()` — параллельно загружает leads/clients/products/analytics
  - `updateLeadStatus()` — обновляет локально + вызывает API
  - `updateSettings()` — сохраняет в localStorage
  - `unreadLeads` — persist в localStorage
  - В `main.tsx` добавлен вызов `store.getState().init()`
- Исправлены package name в Android-тестах

**Что осталось:**
- **Подключить реальный бэкенд:** установить `VITE_API_URL`, переключить `useApi = true`
- Добавить .env файлы (`.env.development`, `.env.production`)
- Настроить авторизацию (сейчас нет логина)
- Доработать Android push-уведомления (нужен `google-services.json`)
- Улучшить обработку ошибок (показать пользователю, что данные моковые, если API недоступен)
- Обновить README.md (сейчас шаблон Vite)

---

## 4. dov-muka (CRM/ERP) — `/tmp/opencode/dov-muka/`

**Статус:** 🔶 Архитектура готова, многое доделано, но не закончено.

**Стек:** FastAPI + SQLAlchemy async + PostgreSQL + Redis + Celery / React 19 + Ant Design + Zustand + TanStack Query

### Бэкенд

**Модели (6):** User, Product, Client, Deal, Order, KnowledgeArticle
**Роуты (6):** auth, products, clients, deals, orders, knowledge_base
**Миграции:** Alembic (initial migration)
**Сиды:** `scripts/seed.py` — админ/менеджер, 4 продукта, 3 статьи

**Что сделано:**
- Добавлены `PUT /products/{id}` и `DELETE /products/{id}` с `ProductUpdate` схемой
- Добавлены `PUT /clients/{id}` и `DELETE /clients/{id}` с `ClientUpdate` схемой
- Созданы `.dockerignore` для `backend/` и `frontend/` (исключены `__pycache__`, `venv`, `node_modules`, `dist`, `.env`)
- Создан `favicon.svg`
- Создан `backend/app/utils/__init__.py`
- Добавлены `.gitkeep` в пустые директории `docker/`, `database/`

### Фронтенд

**Роуты (публичные):** /, /catalog, /catalog/:slug, /contacts, /about, /login
**Роуты (админ):** /admin, /admin/clients, /admin/deals, /admin/orders, /admin/knowledge-base, /admin/products

**Что сделано:**
- Удалены 20 `.js` артефактов из `src/` (рядом с `.tsx`)
- Создана `ProductsPage.tsx` — полный CRUD для товаров:
  - Таблица Ant Design с колонками: название, slug, категория, цена, ед., мин. заказ
  - Модалка создания/редактирования (Form с валидацией)
  - Подтверждение удаления (Popconfirm)
  - Обработка ошибок, пустое состояние, лоадер
- Добавлен роут `/admin/products` в `App.tsx` и пункт меню в `AdminLayout.tsx`
- Исправлена `ContactsPage.tsx` — добавлено поле `company_name` (обязательное), try/catch
- Добавлены `error`/`empty` state на `ClientsPage.tsx`, `DealsPage.tsx`, `OrdersPage.tsx`:
  - `Alert` из Ant Design для ошибок с возможностью закрыть
  - `Empty` для пустых списков

### Инфраструктура

- `docker-compose.yml` — 5 сервисов (db, redis, backend, frontend, nginx)
- `nginx/default.conf` — reverse proxy /api -> backend:8000, / -> frontend:5173
- `backend/Dockerfile` + `frontend/Dockerfile`
- `backend/docker-entrypoint.sh` — миграции + сиды + uvicorn

### Что осталось (критичное)

| # | Что | Где |
|---|-----|-----|
| 1 | **Нет тестов** | `pyproject.toml` содержит pytest/pytest-asyncio, но нет `tests/` |
| 2 | **Secrets в git** | `.env` с паролями, `SECRET_KEY`, `DB_PASSWORD` — в репозитории |
| 3 | **CORS открыт** | `config.py` — `["http://localhost:5173", "http://localhost:3000"]` + все методы/заголовки |
| 4 | **Нет HTTPS** | nginx слушает только 80 порт |
| 5 | **Нет logout endpoint** | `/auth/logout` не реализован |
| 6 | **Нет refresh token** | `useAuth.ts` хранит `refresh_token` в localStorage, но не использует |
| 7 | **/register открыт всем** | Любой может создать пользователя без ограничений |
| 8 | **Нет пагинации UI** | Бэкенд поддерживает `page`/`page_size`, но нет кнопок "следующая страница" |
| 9 | **Нет продукт-админа для загрузки картинок** | `image_url` в модели есть, но нет upload endpoint |
| 10 | **DealsPage требует client_id руками** | Поле "ID клиента" — InputNumber без поиска/выбора |
| 11 | **Inline styles везде** | Нет CSS модулей, вся стилизация через `style={}` |
| 12 | **Нет healthcheck для backend/frontend/nginx** | Только db и redis в compose |
| 13 | **Dockerfile frontend без CMD** | docker-compose переопределяет команду, но сам образ без `ENTRYPOINT` |
| 14 | **Dockerfile backend создаёт `/app/static`** | Но нет static serving в main.py |
| 15 | **Нет rate limiting** | API не защищён от дудоса |
| 16 | **KnowledgeBase не использует Pydantic response** | Возвращает голые dict вместо response_model |

---

## Приоритеты для Mythos 5

1. **dov-muka (CRM)** — самый масштабный проект, много мелких доработок. Сначала security (secrets, CORS, HTTPS, /register), потом недостающий функционал (пагинация, refresh token, тесты, картинки).
2. **flourradar (PWA)** — подключить реальный API, когда появится бэкенд. Сейчас работает на моках.
3. **tg_radar_app (Kivy)** — некритично, можно улучшать UI и добавлять уведомления.
4. **tg_radar (aiogram)** — production-ready, не требует изменений.
