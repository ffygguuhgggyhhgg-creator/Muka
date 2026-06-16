from pydantic_settings import BaseSettings
from typing import List
import os
from dotenv import load_dotenv


class Settings(BaseSettings):
    bot_token: str = ""
    admin_ids: List[int] = []
    database_url: str = "sqlite:///data/radar.db"

    model_config = {"env_file": ".env", "env_file_encoding": "utf-8"}

    @classmethod
    def load(cls) -> "Settings":
        load_dotenv()
        admin_ids_str = os.getenv("ADMIN_IDS", "")
        admin_ids = [int(x.strip()) for x in admin_ids_str.split(",") if x.strip().isdigit()]
        return cls(
            bot_token=os.getenv("BOT_TOKEN", ""),
            admin_ids=admin_ids,
            database_url=os.getenv("DATABASE_URL", "sqlite:///data/radar.db"),
        )


settings = Settings.load()
DATA_DIR = os.path.join(os.path.dirname(__file__), "data")
os.makedirs(DATA_DIR, exist_ok=True)
