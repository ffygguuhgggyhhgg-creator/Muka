import sqlite3
import json
import os
from typing import Optional, List
from datetime import datetime

from config import settings, DATA_DIR
from database.models import Project, SourceChat, Lead


class Database:
    def __init__(self):
        db_path = settings.database_url.replace("sqlite:///", "")
        if not os.path.isabs(db_path):
            db_path = os.path.join(DATA_DIR, os.path.basename(db_path))
        os.makedirs(os.path.dirname(db_path) or ".", exist_ok=True)
        self.db_path = db_path
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
                source_chat_id INTEGER NOT NULL,
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
                FOREIGN KEY (project_id) REFERENCES projects(id) ON DELETE CASCADE,
                FOREIGN KEY (source_chat_id) REFERENCES source_chats(id) ON DELETE CASCADE
            );
            CREATE INDEX IF NOT EXISTS idx_leads_project ON leads(project_id);
            CREATE INDEX IF NOT EXISTS idx_leads_status ON leads(status);
            CREATE INDEX IF NOT EXISTS idx_leads_created ON leads(created_at);
            CREATE UNIQUE INDEX IF NOT EXISTS idx_unique_message 
                ON leads(source_chat_id, message_id);
        """)
        conn.commit()
        conn.close()

    # ---- Projects ----

    def create_project(self, name: str, keywords: list = None,
                       stop_words: list = None) -> Project:
        conn = self._get_conn()
        p = Project(name=name, keywords=keywords or [], stop_words=stop_words or [])
        conn.execute(
            "INSERT INTO projects (name, keywords, stop_words, is_active, created_at) VALUES (?, ?, ?, ?, ?)",
            (p.name, json.dumps(p.keywords), json.dumps(p.stop_words), 1, p.created_at)
        )
        conn.commit()
        p.id = conn.execute("SELECT last_insert_rowid()").fetchone()[0]
        conn.close()
        return p

    def get_project(self, project_id: int) -> Optional[Project]:
        conn = self._get_conn()
        row = conn.execute("SELECT * FROM projects WHERE id = ?", (project_id,)).fetchone()
        conn.close()
        if not row:
            return None
        return self._row_to_project(row)

    def get_projects(self, only_active: bool = False) -> List[Project]:
        conn = self._get_conn()
        query = "SELECT * FROM projects"
        if only_active:
            query += " WHERE is_active = 1"
        query += " ORDER BY created_at DESC"
        rows = conn.execute(query).fetchall()
        conn.close()
        return [self._row_to_project(r) for r in rows]

    def update_project(self, project_id: int, **kwargs) -> bool:
        conn = self._get_conn()
        fields = []
        values = []
        for key, val in kwargs.items():
            if key == "keywords" or key == "stop_words":
                fields.append(f"{key} = ?")
                values.append(json.dumps(val))
            elif key == "is_active":
                fields.append(f"{key} = ?")
                values.append(1 if val else 0)
            elif key == "name":
                fields.append(f"{key} = ?")
                values.append(val)
        if not fields:
            conn.close()
            return False
        values.append(project_id)
        conn.execute(f"UPDATE projects SET {', '.join(fields)} WHERE id = ?", values)
        conn.commit()
        conn.close()
        return True

    def delete_project(self, project_id: int) -> bool:
        conn = self._get_conn()
        conn.execute("DELETE FROM source_chats WHERE project_id = ?", (project_id,))
        conn.execute("DELETE FROM leads WHERE project_id = ?", (project_id,))
        conn.execute("DELETE FROM projects WHERE id = ?", (project_id,))
        conn.commit()
        conn.close()
        return True

    # ---- Source Chats ----

    def add_source_chat(self, project_id: int, chat_id: int,
                        chat_title: str = "", chat_username: str = "") -> SourceChat:
        conn = self._get_conn()
        existing = conn.execute(
            "SELECT * FROM source_chats WHERE project_id = ? AND (chat_id = ? OR (chat_username != '' AND chat_username = ?))",
            (project_id, chat_id, chat_username)
        ).fetchone()
        if existing:
            conn.close()
            sc = self._row_to_source_chat(existing)
            if not sc.is_active:
                self.update_source_chat(sc.id, is_active=True)
                sc.is_active = True
            if sc.chat_id == 0 and chat_id != 0:
                self.update_source_chat(sc.id, is_active=True)
                conn2 = self._get_conn()
                conn2.execute("UPDATE source_chats SET chat_id = ? WHERE id = ?", (chat_id, sc.id))
                conn2.commit()
                conn2.close()
                sc.chat_id = chat_id
            if not sc.chat_username and chat_username:
                conn2 = self._get_conn()
                conn2.execute("UPDATE source_chats SET chat_username = ? WHERE id = ?", (chat_username, sc.id))
                conn2.commit()
                conn2.close()
                sc.chat_username = chat_username
            return sc

        sc = SourceChat(project_id=project_id, chat_id=chat_id,
                        chat_title=chat_title, chat_username=chat_username)
        conn.execute(
            "INSERT INTO source_chats (project_id, chat_id, chat_title, chat_username, is_active) VALUES (?, ?, ?, ?, ?)",
            (sc.project_id, sc.chat_id, sc.chat_title, sc.chat_username, 1)
        )
        conn.commit()
        sc.id = conn.execute("SELECT last_insert_rowid()").fetchone()[0]
        conn.close()
        return sc

    def get_source_chats(self, project_id: int = None,
                         only_active: bool = False) -> List[SourceChat]:
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
        return [self._row_to_source_chat(r) for r in rows]

    def update_source_chat(self, chat_id: int, **kwargs) -> bool:
        conn = self._get_conn()
        fields = []
        values = []
        for key, val in kwargs.items():
            if key == "is_active":
                fields.append(f"{key} = ?")
                values.append(1 if val else 0)
        if not fields:
            conn.close()
            return False
        values.append(chat_id)
        conn.execute(f"UPDATE source_chats SET {', '.join(fields)} WHERE id = ?", values)
        conn.commit()
        conn.close()
        return True

    def remove_source_chat(self, chat_id: int) -> bool:
        conn = self._get_conn()
        conn.execute("DELETE FROM source_chats WHERE id = ?", (chat_id,))
        conn.commit()
        conn.close()
        return True

    # ---- Leads ----

    def add_lead(self, project_id: int, source_chat_id: int,
                 sender_id: int, sender_name: str, username: str,
                 message_text: str, message_id: int, chat_title: str,
                 message_link: str) -> Optional[Lead]:
        conn = self._get_conn()
        try:
            conn.execute("""
                INSERT INTO leads (project_id, source_chat_id, sender_id, sender_name,
                    username, message_text, message_id, chat_title, message_link,
                    is_read, is_contacted, status, created_at)
                VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, 0, 0, 'new', ?)
            """, (project_id, source_chat_id, sender_id, sender_name, username,
                  message_text, message_id, chat_title, message_link,
                  datetime.now().isoformat()))
            conn.commit()
            lead_id = conn.execute("SELECT last_insert_rowid()").fetchone()[0]
            conn.close()
            return self.get_lead(lead_id)
        except sqlite3.IntegrityError:
            conn.close()
            return None

    def get_lead(self, lead_id: int) -> Optional[Lead]:
        conn = self._get_conn()
        row = conn.execute("SELECT * FROM leads WHERE id = ?", (lead_id,)).fetchone()
        conn.close()
        if not row:
            return None
        return self._row_to_lead(row)

    def get_leads(self, project_id: int = None, status: str = None,
                  limit: int = 50, offset: int = 0) -> List[Lead]:
        conn = self._get_conn()
        conditions = []
        params = []
        if project_id:
            conditions.append("project_id = ?")
            params.append(project_id)
        if status:
            conditions.append("status = ?")
            params.append(status)
        where = " WHERE " + " AND ".join(conditions) if conditions else ""
        rows = conn.execute(
            f"SELECT * FROM leads{where} ORDER BY created_at DESC LIMIT ? OFFSET ?",
            params + [limit, offset]
        ).fetchall()
        conn.close()
        return [self._row_to_lead(r) for r in rows]

    def get_unread_leads_count(self, project_id: int = None) -> int:
        conn = self._get_conn()
        if project_id:
            row = conn.execute(
                "SELECT COUNT(*) FROM leads WHERE project_id = ? AND is_read = 0",
                (project_id,)
            ).fetchone()
        else:
            row = conn.execute("SELECT COUNT(*) FROM leads WHERE is_read = 0").fetchone()
        conn.close()
        return row[0]

    def update_lead(self, lead_id: int, **kwargs) -> bool:
        conn = self._get_conn()
        fields = []
        values = []
        for key, val in kwargs.items():
            if key in ("is_read", "is_contacted"):
                fields.append(f"{key} = ?")
                values.append(1 if val else 0)
            elif key == "status":
                fields.append(f"{key} = ?")
                values.append(val)
        if not fields:
            conn.close()
            return False
        values.append(lead_id)
        conn.execute(f"UPDATE leads SET {', '.join(fields)} WHERE id = ?", values)
        conn.commit()
        conn.close()
        return True

    # ---- Stats ----

    def get_stats(self, project_id: int = None) -> dict:
        conn = self._get_conn()
        if project_id:
            total = conn.execute("SELECT COUNT(*) FROM leads WHERE project_id = ?",
                                 (project_id,)).fetchone()[0]
            unread = conn.execute("SELECT COUNT(*) FROM leads WHERE project_id = ? AND is_read = 0",
                                  (project_id,)).fetchone()[0]
            contacted = conn.execute("SELECT COUNT(*) FROM leads WHERE project_id = ? AND is_contacted = 1",
                                     (project_id,)).fetchone()[0]
            today = conn.execute(
                "SELECT COUNT(*) FROM leads WHERE project_id = ? AND date(created_at) = date('now')",
                (project_id,)).fetchone()[0]
            chats = conn.execute("SELECT COUNT(*) FROM source_chats WHERE project_id = ? AND is_active = 1",
                                 (project_id,)).fetchone()[0]
        else:
            total = conn.execute("SELECT COUNT(*) FROM leads").fetchone()[0]
            unread = conn.execute("SELECT COUNT(*) FROM leads WHERE is_read = 0").fetchone()[0]
            contacted = conn.execute("SELECT COUNT(*) FROM leads WHERE is_contacted = 1").fetchone()[0]
            today = conn.execute(
                "SELECT COUNT(*) FROM leads WHERE date(created_at) = date('now')").fetchone()[0]
            chats = conn.execute("SELECT COUNT(*) FROM source_chats WHERE is_active = 1").fetchone()[0]
        conn.close()
        return {
            "total_leads": total,
            "unread": unread,
            "contacted": contacted,
            "today": today,
            "active_chats": chats,
        }

    # ---- Helpers ----

    def _row_to_project(self, row) -> Project:
        return Project(
            id=row["id"],
            name=row["name"],
            keywords=json.loads(row["keywords"]),
            stop_words=json.loads(row["stop_words"]),
            is_active=bool(row["is_active"]),
            created_at=row["created_at"],
        )

    def _row_to_source_chat(self, row) -> SourceChat:
        return SourceChat(
            id=row["id"],
            project_id=row["project_id"],
            chat_id=row["chat_id"],
            chat_title=row["chat_title"],
            chat_username=row["chat_username"],
            is_active=bool(row["is_active"]),
        )

    def _row_to_lead(self, row) -> Lead:
        return Lead(
            id=row["id"],
            project_id=row["project_id"],
            source_chat_id=row["source_chat_id"],
            sender_id=row["sender_id"],
            sender_name=row["sender_name"],
            username=row["username"],
            message_text=row["message_text"],
            message_id=row["message_id"],
            chat_title=row["chat_title"],
            message_link=row["message_link"],
            is_read=bool(row["is_read"]),
            is_contacted=bool(row["is_contacted"]),
            status=row["status"],
            created_at=row["created_at"],
        )


db = Database()
