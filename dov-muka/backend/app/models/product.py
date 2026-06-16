from sqlalchemy import Column, Integer, String, Text, Float, Boolean, DateTime, JSON
from sqlalchemy.sql import func

from app.core.database import Base


class Product(Base):
    __tablename__ = "products"

    id = Column(Integer, primary_key=True, index=True)
    name = Column(String(255), nullable=False)
    slug = Column(String(255), unique=True, index=True, nullable=False)
    category = Column(String(100), nullable=False)
    sort = Column(String(50))
    description = Column(Text)
    full_description = Column(Text)
    gost = Column(String(100))
    specifications = Column(JSON)
    packaging = Column(JSON)
    min_order = Column(Float)
    unit = Column(String(20), default="т")
    price = Column(Float)
    price_on_request = Column(Boolean, default=False)
    application = Column(Text)
    is_active = Column(Boolean, default=True)
    sort_order = Column(Integer, default=0)
    created_at = Column(DateTime(timezone=True), server_default=func.now())
    updated_at = Column(DateTime(timezone=True), onupdate=func.now())
