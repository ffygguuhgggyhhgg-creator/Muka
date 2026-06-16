import sqlite3
import json
import os
from datetime import datetime


class Database:
    def __init__(self, db_path):
        self.db_path = db_path
        os.makedirs(os.path.dirname(db_path), exist_ok=True)
        self._init_db()

    def _get_conn(self):
        conn = sqlite3.connect(self.db_path)
        conn.row_factory = sqlite3.Row
        conn.execute("PRAGMA journal_mode=WAL")
        return conn

    def _init_db(self):
        conn = self._get_conn()
        conn.executescript("""
            CREATE TABLE IF NOT EXISTS projects (
                id INTEGER PRIMARY KEY AUTOINCREMENT,
                name TEXT NOT NULL,
                keywords TEXT NOT NULL DEFAULT '[]',
                stop_words TEXT NOT NULL DEFAULT '[]',
                is_active INTEGER NOT NULL DEFAULT 1,
                created_at TEXT NOT NULL
            );
            CREATE TABLE IF NOT EXISTS source_chats (
                id INTEGER PRIMARY KEY AUTOINCREMENT,
                project_id INTEGER NOT NULL,
                chat_id INTEGER NOT NULL,
                chat_title TEXT NOT NULL DEFAULT '',
                chat_username TEXT NOT NULL DEFAULT '',
                is_active INTEGER NOT NULL DEFAULT 1,
                FOREIGN KEY (project_id) REFERENCES projects(id) ON DELETE CASCADE
            );
            CREATE TABLE IF NOT EXISTS leads (
                id INTEGER PRIMARY KEY AUTOINCREMENT,
                project_id INTEGER NOT NULL,
                source_chat_id INTEGER NOT NULL DEFAULT 0,
                sender_id INTEGER NOT NULL DEFAULT 0,
                sender_name TEXT NOT NULL DEFAULT '',
                username TEXT NOT NULL DEFAULT '',
                message_text TEXT NOT NULL DEFAULT '',
                message_id INTEGER NOT NULL DEFAULT 0,
                chat_title TEXT NOT NULL DEFAULT '',
                message_link TEXT NOT NULL DEFAULT '',
                is_read INTEGER NOT NULL DEFAULT 0,
                is_contacted INTEGER NOT NULL DEFAULT 0,
                status TEXT NOT NULL DEFAULT 'new',
                created_at TEXT NOT NULL,
                FOREIGN KEY (project_id) REFERENCES projects(id) ON DELETE CASCADE
            );
            CREATE TABLE IF NOT EXISTS config (
                key TEXT PRIMARY KEY,
                value TEXT NOT NULL
            );
        """)
        conn.commit()
        conn.close()

    # ---- Config ----

    def get_config(self, key, default=""):
        conn = self._get_conn()
        row = conn.execute("SELECT value FROM config WHERE key = ?", (key,)).fetchone()
        conn.close()
        return row["value"] if row else default

    def set_config(self, key, value):
        conn = self._get_conn()
        conn.execute("REPLACE INTO config (key, value) VALUES (?, ?)", (key, value))
        conn.commit()
        conn.close()

    # ---- Projects ----

    def create_project(self, name, keywords=None, stop_words=None):
        conn = self._get_conn()
        now = datetime.now().isoformat()
        conn.execute(
            "INSERT INTO projects (name, keywords, stop_words, is_active, created_at) VALUES (?, ?, ?, 1, ?)",
            (name, json.dumps(keywords or []), json.dumps(stop_words or []), now)
        )
        conn.commit()
        pid = conn.execute("SELECT last_insert_rowid()").fetchone()[0]
        conn.close()
        return pid

    def get_projects(self, only_active=False):
        conn = self._get_conn()
        query = "SELECT * FROM projects"
        if only_active:
            query += " WHERE is_active = 1"
        query += " ORDER BY created_at DESC"
        rows = conn.execute(query).fetchall()
        conn.close()
        return [dict(r) for r in rows]

    def get_project(self, pid):
        conn = self._get_conn()
        row = conn.execute("SELECT * FROM projects WHERE id = ?", (pid,)).fetchone()
        conn.close()
        return dict(row) if row else None

    def update_project(self, pid, **kwargs):
        conn = self._get_conn()
        fields = []
        values = []
        for k, v in kwargs.items():
            if k in ("keywords", "stop_words"):
                fields.append(f"{k} = ?")
                values.append(json.dumps(v))
            elif k in ("is_active",):
                fields.append(f"{k} = ?")
                values.append(1 if v else 0)
            elif k == "name":
                fields.append(f"{k} = ?")
                values.append(v)
        if fields:
            values.append(pid)
            conn.execute(f"UPDATE projects SET {', '.join(fields)} WHERE id = ?", values)
            conn.commit()
        conn.close()

    def delete_project(self, pid):
        conn = self._get_conn()
        conn.execute("DELETE FROM source_chats WHERE project_id = ?", (pid,))
        conn.execute("DELETE FROM leads WHERE project_id = ?", (pid,))
        conn.execute("DELETE FROM projects WHERE id = ?", (pid,))
        conn.commit()
        conn.close()

    # ---- Chats ----

    def add_source_chat(self, project_id, chat_id, chat_title="", chat_username=""):
        conn = self._get_conn()
        existing = conn.execute(
            "SELECT * FROM source_chats WHERE project_id = ? AND chat_id = ?",
            (project_id, chat_id)
        ).fetchone()
        if existing:
            if not existing["is_active"]:
                conn.execute("UPDATE source_chats SET is_active = 1 WHERE id = ?", (existing["id"],))
            conn.commit()
            conn.close()
            return existing["id"]
        conn.execute(
            "INSERT INTO source_chats (project_id, chat_id, chat_title, chat_username, is_active) VALUES (?, ?, ?, ?, 1)",
            (project_id, chat_id, chat_title, chat_username)
        )
        conn.commit()
        cid = conn.execute("SELECT last_insert_rowid()").fetchone()[0]
        conn.close()
        return cid

    def get_source_chats(self, project_id=None, only_active=False):
        conn = self._get_conn()
        if project_id:
            query = "SELECT * FROM source_chats WHERE project_id = ?"
            params = [project_id]
        else:
            query = "SELECT * FROM source_chats"
            params = []
        if only_active:
            query += " AND is_active = 1" if project_id else " WHERE is_active = 1"
        query += " ORDER BY chat_title"
        rows = conn.execute(query, params).fetchall()
        conn.close()
        return [dict(r) for r in rows]

    def remove_source_chat(self, cid):
        conn = self._get_conn()
        conn.execute("DELETE FROM source_chats WHERE id = ?", (cid,))
        conn.commit()
        conn.close()

    # ---- Leads ----

    def add_lead(self, project_id, source_chat_id, sender_id, sender_name, username,
                 message_text, message_id, chat_title, message_link):
        conn = self._get_conn()
        existing = conn.execute(
            "SELECT id FROM leads WHERE source_chat_id = ? AND message_id = ?",
            (source_chat_id, message_id)
        ).fetchone()
        if existing:
            conn.close()
            return None
        now = datetime.now().isoformat()
        conn.execute(
            "INSERT INTO leads (project_id, source_chat_id, sender_id, sender_name, "
            "username, message_text, message_id, chat_title, message_link, "
            "is_read, is_contacted, status, created_at) "
            "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, 0, 0, 'new', ?)",
            (project_id, source_chat_id, sender_id, sender_name, username or "",
             message_text[:1000], message_id, chat_title, message_link, now)
        )
        conn.commit()
        lid = conn.execute("SELECT last_insert_rowid()").fetchone()[0]
        conn.close()
        return lid

    def get_leads(self, limit=50, offset=0, project_id=None):
        conn = self._get_conn()
        if project_id:
            rows = conn.execute(
                "SELECT * FROM leads WHERE project_id = ? ORDER BY created_at DESC LIMIT ? OFFSET ?",
                (project_id, limit, offset)
            ).fetchall()
        else:
            rows = conn.execute(
                "SELECT * FROM leads ORDER BY created_at DESC LIMIT ? OFFSET ?",
                (limit, offset)
            ).fetchall()
        conn.close()
        return [dict(r) for r in rows]

    def get_unread_count(self, project_id=None):
        conn = self._get_conn()
        if project_id:
            row = conn.execute("SELECT COUNT(*) FROM leads WHERE project_id = ? AND is_read = 0",
                               (project_id,)).fetchone()
        else:
            row = conn.execute("SELECT COUNT(*) FROM leads WHERE is_read = 0").fetchone()
        conn.close()
        return row[0]

    def update_lead(self, lid, **kwargs):
        conn = self._get_conn()
        fields = []
        values = []
        for k, v in kwargs.items():
            if k in ("is_read", "is_contacted"):
                fields.append(f"{k} = ?")
                values.append(1 if v else 0)
            elif k == "status":
                fields.append(f"{k} = ?")
                values.append(v)
        if fields:
            values.append(lid)
            conn.execute(f"UPDATE leads SET {', '.join(fields)} WHERE id = ?", values)
            conn.commit()
        conn.close()

    def get_lead(self, lid):
        conn = self._get_conn()
        row = conn.execute("SELECT * FROM leads WHERE id = ?", (lid,)).fetchone()
        conn.close()
        return dict(row) if row else None

    def get_stats(self, project_id=None):
        conn = self._get_conn()
        if project_id:
            total = conn.execute("SELECT COUNT(*) FROM leads WHERE project_id = ?",
                                 (project_id,)).fetchone()[0]
            unread = conn.execute("SELECT COUNT(*) FROM leads WHERE project_id = ? AND is_read = 0",
                                  (project_id,)).fetchone()[0]
        else:
            total = conn.execute("SELECT COUNT(*) FROM leads").fetchone()[0]
            unread = conn.execute("SELECT COUNT(*) FROM leads WHERE is_read = 0").fetchone()[0]
        conn.close()
        return {"total": total, "unread": unread}
