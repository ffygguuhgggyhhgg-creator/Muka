from pydantic_settings import BaseSettings
from typing import Optional


class Settings(BaseSettings):
    APP_NAME: str = "TD Shikhabalova Platform"
    DEBUG: bool = True

    DATABASE_URL: str = "postgresql+asyncpg://dovmuka:dovmuka_secret_2024@localhost:5432/dovmuka"
    REDIS_URL: str = "redis://localhost:6379/0"

    SECRET_KEY: str = "super-secret-key-change-in-production"
    ALGORITHM: str = "HS256"
    ACCESS_TOKEN_EXPIRE_MINUTES: int = 60
    REFRESH_TOKEN_EXPIRE_DAYS: int = 7

    CORS_ORIGINS: list[str] = ["http://localhost:5173", "http://localhost:3000", "http://localhost"]

    SENTRY_DSN: Optional[str] = None

    UPLOAD_DIR: str = "/app/uploads"

    class Config:
        env_file = ".env"


settings = Settings()
