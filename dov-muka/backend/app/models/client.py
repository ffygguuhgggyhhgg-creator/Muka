from sqlalchemy import Column, Integer, String, Text, Float, Boolean, DateTime, ForeignKey, JSON, Date
from sqlalchemy.sql import func
from sqlalchemy.orm import relationship

from app.core.database import Base


class Client(Base):
    __tablename__ = "clients"

    id = Column(Integer, primary_key=True, index=True)
    company_name = Column(String(255), nullable=False)
    inn = Column(String(12), index=True)
    kpp = Column(String(9))
    ogrn = Column(String(15))
    legal_address = Column(Text)
    actual_address = Column(Text)
    contact_person = Column(String(255))
    phone = Column(String(20))
    email = Column(String(255), index=True)
    website = Column(String(255))
    category = Column(String(50), default="wholesale")
    status = Column(String(50), default="new")
    manager_id = Column(Integer, ForeignKey("users.id"))
    discount = Column(Float, default=0)
    credit_limit = Column(Float, default=0)
    payment_deferral_days = Column(Integer, default=0)
    balance = Column(Float, default=0)
    notes = Column(Text)
    source = Column(String(50))
    registered_at = Column(DateTime(timezone=True), server_default=func.now())
    created_at = Column(DateTime(timezone=True), server_default=func.now())
    updated_at = Column(DateTime(timezone=True), onupdate=func.now())

    manager = relationship("User")
