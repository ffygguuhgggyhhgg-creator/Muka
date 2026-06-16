import sqlite3
import json
from datetime import datetime
from typing import Optional, List


class Project:
    def __init__(self, id: int = 0, name: str = "", keywords: list = None,
                 stop_words: list = None, is_active: bool = True,
                 created_at: str = ""):
        self.id = id
        self.name = name
        self.keywords = keywords or []
        self.stop_words = stop_words or []
        self.is_active = is_active
        self.created_at = created_at or datetime.now().isoformat()

    def to_dict(self):
        return {
            "id": self.id,
            "name": self.name,
            "keywords": self.keywords,
            "stop_words": self.stop_words,
            "is_active": self.is_active,
            "created_at": self.created_at,
        }


class SourceChat:
    def __init__(self, id: int = 0, project_id: int = 0,
                 chat_id: int = 0, chat_title: str = "",
                 chat_username: str = "", is_active: bool = True):
        self.id = id
        self.project_id = project_id
        self.chat_id = chat_id
        self.chat_title = chat_title
        self.chat_username = chat_username
        self.is_active = is_active

    def to_dict(self):
        return {
            "id": self.id,
            "project_id": self.project_id,
            "chat_id": self.chat_id,
            "chat_title": self.chat_title,
            "chat_username": self.chat_username,
            "is_active": self.is_active,
        }


class Lead:
    def __init__(self, id: int = 0, project_id: int = 0,
                 source_chat_id: int = 0, sender_id: int = 0,
                 sender_name: str = "", username: str = "",
                 message_text: str = "", message_id: int = 0,
                 chat_title: str = "", message_link: str = "",
                 is_read: bool = False, is_contacted: bool = False,
                 status: str = "new", created_at: str = ""):
        self.id = id
        self.project_id = project_id
        self.source_chat_id = source_chat_id
        self.sender_id = sender_id
        self.sender_name = sender_name
        self.username = username
        self.message_text = message_text
        self.message_id = message_id
        self.chat_title = chat_title
        self.message_link = message_link
        self.is_read = is_read
        self.is_contacted = is_contacted
        self.status = status
        self.created_at = created_at or datetime.now().isoformat()

    def to_dict(self):
        return {
            "id": self.id,
            "project_id": self.project_id,
            "source_chat_id": self.source_chat_id,
            "sender_id": self.sender_id,
            "sender_name": self.sender_name,
            "username": self.username,
            "message_text": self.message_text,
            "message_id": self.message_id,
            "chat_title": self.chat_title,
            "message_link": self.message_link,
            "is_read": self.is_read,
            "is_contacted": self.is_contacted,
            "status": self.status,
            "created_at": self.created_at,
        }
