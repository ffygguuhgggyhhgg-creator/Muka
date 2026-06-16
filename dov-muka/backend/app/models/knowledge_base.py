from sqlalchemy import Column, Integer, String, Text, Boolean, DateTime, ForeignKey, JSON
from sqlalchemy.sql import func
from sqlalchemy.orm import relationship

from app.core.database import Base


class KnowledgeArticle(Base):
    __tablename__ = "knowledge_articles"

    id = Column(Integer, primary_key=True, index=True)
    title = Column(String(255), nullable=False)
    slug = Column(String(255), unique=True, index=True, nullable=False)
    category = Column(String(50), nullable=False)
    tags = Column(JSON)
    content = Column(Text, nullable=False)
    excerpt = Column(Text)
    author_id = Column(Integer, ForeignKey("users.id"))
    is_published = Column(Boolean, default=True)
    is_restricted = Column(Boolean, default=False)
    allowed_roles = Column(JSON)
    view_count = Column(Integer, default=0)
    version = Column(Integer, default=1)
    created_at = Column(DateTime(timezone=True), server_default=func.now())
    updated_at = Column(DateTime(timezone=True), onupdate=func.now())

    author = relationship("User")
