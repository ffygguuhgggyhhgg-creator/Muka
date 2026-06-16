from sqlalchemy import Column, Integer, String, Text, Float, Boolean, DateTime, ForeignKey, JSON
from sqlalchemy.sql import func
from sqlalchemy.orm import relationship

from app.core.database import Base


class Deal(Base):
    __tablename__ = "deals"

    id = Column(Integer, primary_key=True, index=True)
    client_id = Column(Integer, ForeignKey("clients.id"), nullable=False)
    manager_id = Column(Integer, ForeignKey("users.id"), nullable=False)
    title = Column(String(255), nullable=False)
    stage = Column(String(50), default="new_lead")
    amount = Column(Float, default=0)
    discount = Column(Float, default=0)
    products = Column(JSON)
    delivery_type = Column(String(50))
    delivery_date = Column(DateTime(timezone=True))
    payment_terms = Column(String(100))
    source = Column(String(50), default="site")
    notes = Column(Text)
    documents = Column(JSON)
    closed_at = Column(DateTime(timezone=True))
    closed_reason = Column(String(255))
    created_at = Column(DateTime(timezone=True), server_default=func.now())
    updated_at = Column(DateTime(timezone=True), onupdate=func.now())

    client = relationship("Client")
    manager = relationship("User")
