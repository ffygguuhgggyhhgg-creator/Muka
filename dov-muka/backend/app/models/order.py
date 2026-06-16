from sqlalchemy import Column, Integer, String, Text, Float, Boolean, DateTime, ForeignKey, JSON
from sqlalchemy.sql import func
from sqlalchemy.orm import relationship

from app.core.database import Base


class Order(Base):
    __tablename__ = "orders"

    id = Column(Integer, primary_key=True, index=True)
    order_number = Column(String(50), unique=True, index=True, nullable=False)
    client_id = Column(Integer, ForeignKey("clients.id"), nullable=False)
    deal_id = Column(Integer, ForeignKey("deals.id"))
    manager_id = Column(Integer, ForeignKey("users.id"))
    status = Column(String(50), default="new")
    items = Column(JSON)
    total_amount = Column(Float, default=0)
    discount = Column(Float, default=0)
    delivery_type = Column(String(50))
    delivery_address = Column(Text)
    delivery_date = Column(DateTime(timezone=True))
    payment_status = Column(String(50), default="pending")
    payment_date = Column(DateTime(timezone=True))
    documents = Column(JSON)
    notes = Column(Text)
    source = Column(String(50), default="site")
    created_at = Column(DateTime(timezone=True), server_default=func.now())
    updated_at = Column(DateTime(timezone=True), onupdate=func.now())

    client = relationship("Client")
    deal = relationship("Deal")
    manager = relationship("User")
