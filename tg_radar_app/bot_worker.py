import json
import logging
import threading
import time
import requests

logger = logging.getLogger("tg_radar.bot_worker")


class MessageFilter:
    def __init__(self, keywords, stop_words):
        self.keywords = [kw.lower().strip() for kw in keywords if kw.strip()]
        self.stop_words = [sw.lower().strip() for sw in stop_words if sw.strip()]

    def is_relevant(self, text):
        if not text:
            return False
        text_lower = text.lower()
        for sw in self.stop_words:
            if sw in text_lower:
                return False
        for kw in self.keywords:
            if kw in text_lower:
                return True
        return False


class BotWorker:
    def __init__(self, db, on_lead_callback=None, on_log_callback=None):
        self.db = db
        self.on_lead = on_lead_callback
        self.on_log = on_log_callback
        self._running = False
        self._thread = None
        self._offset = 0
        self._bot_token = ""
        self._admin_ids = []

    def log(self, msg):
        logger.info(msg)
        if self.on_log:
            self.on_log(msg)

    def configure(self, bot_token, admin_ids):
        self._bot_token = bot_token
        self._admin_ids = admin_ids
        self.db.set_config("bot_token", bot_token)
        self.db.set_config("admin_ids", json.dumps(admin_ids))

    def load_config(self):
        token = self.db.get_config("bot_token", "")
        ids_str = self.db.get_config("admin_ids", "[]")
        try:
            ids = json.loads(ids_str)
        except (json.JSONDecodeError, TypeError):
            ids = []
        self._bot_token = token
        self._admin_ids = ids

    def is_configured(self):
        return bool(self._bot_token and self._admin_ids)

    @property
    def running(self):
        return self._running

    def start(self):
        if self._running:
            return
        self.load_config()
        if not self.is_configured():
            self.log("❌ Bot not configured. Set token and admin IDs first.")
            return
        self._running = True
        self._thread = threading.Thread(target=self._run, daemon=True)
        self._thread.start()
        self.log("✅ Bot started")

    def stop(self):
        self._running = False
        self.log("⏹ Bot stopped")

    def _send_message(self, chat_id, text):
        try:
            requests.post(
                f"https://api.telegram.org/bot{self._bot_token}/sendMessage",
                json={"chat_id": chat_id, "text": text, "parse_mode": "HTML"},
                timeout=10,
            )
        except Exception as e:
            self.log(f"Send error: {e}")

    def _notify_admin(self, project_name, lead):
        admin_ids = self._admin_ids
        text = (
            f"🎯 <b>Новый лид!</b>\n"
            f"━━━━━━━━━━━━━━\n"
            f"📁 Проект: <b>{project_name}</b>\n"
            f"💬 Чат: <b>{lead.get('chat_title', '')}</b>\n"
            f"👤 {lead.get('sender_name', 'unknown')}"
            f"{' (@' + lead.get('username', '') + ')' if lead.get('username') else ''}\n"
            f"📝 {lead.get('message_text', '')[:400]}\n"
        )
        if lead.get("message_link"):
            text += f"🔗 <a href='{lead['message_link']}'>Перейти</a>\n"
        text += f"\n<code>/lead_{lead['id']}</code>"
        for aid in admin_ids:
            self._send_message(aid, text)

    def _run(self):
        self.log("Bot worker started")
        while self._running:
            try:
                self._poll_once()
            except Exception as e:
                self.log(f"Poll error: {e}")
                time.sleep(5)

    def _poll_once(self):
        url = f"https://api.telegram.org/bot{self._bot_token}/getUpdates"
        params = {
            "offset": self._offset,
            "timeout": 30,
            "allowed_updates": json.dumps(["message"]),
        }
        resp = requests.get(url, params=params, timeout=35)
        if resp.status_code != 200:
            time.sleep(5)
            return

        data = resp.json()
        if not data.get("ok"):
            return

        for update in data.get("result", []):
            self._offset = update["update_id"] + 1
            message = update.get("message")
            if not message:
                continue

            self._process_message(message)

    def _process_message(self, msg):
        chat = msg.get("chat", {})
        chat_type = chat.get("type", "")

        if chat_type not in ("group", "supergroup"):
            return

        text = msg.get("text", "") or msg.get("caption", "")
        if not text:
            return

        chat_id = chat["id"]

        projects = self.db.get_projects(only_active=True)
        for project in projects:
            keywords = json.loads(project.get("keywords", "[]"))
            stop_words = json.loads(project.get("stop_words", "[]"))
            mf = MessageFilter(keywords, stop_words)

            if not mf.is_relevant(text):
                continue

            source_chats = self.db.get_source_chats(project_id=project["id"], only_active=True)
            chat_ids = {c["chat_id"] for c in source_chats}
            if chat_id not in chat_ids:
                continue

            sender = msg.get("from", {})
            sender_id = sender.get("id", 0)
            sender_name = sender.get("first_name", "") or ""
            if sender.get("last_name"):
                sender_name += f" {sender['last_name']}"
            username = sender.get("username", "") or ""
            chat_title = chat.get("title") or chat.get("username", "") or str(chat_id)
            chat_username = chat.get("username", "") or ""
            message_id = msg.get("message_id", 0)

            message_link = ""
            if chat_username:
                message_link = f"https://t.me/{chat_username}/{message_id}"
            elif str(chat_id).startswith("-100"):
                message_link = f"https://t.me/c/{str(chat_id)[4:]}/{message_id}"
            else:
                message_link = f"https://t.me/c/{chat_id}/{message_id}"

            sc_id = self.db.add_source_chat(
                project["id"], chat_id, chat_title, chat_username
            )

            lid = self.db.add_lead(
                project["id"], sc_id, sender_id, sender_name, username,
                text, message_id, chat_title, message_link
            )

            if lid:
                lead = self.db.get_lead(lid)
                self.log(f"🎯 Lead! {project['name']} / {chat_title} / {sender_name}")
                self._notify_admin(project["name"], lead or {"id": lid})
                if self.on_lead:
                    self.on_lead(project, lead)
