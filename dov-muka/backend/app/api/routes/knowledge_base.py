from fastapi import APIRouter, Depends, HTTPException, Query
from sqlalchemy.ext.asyncio import AsyncSession
from sqlalchemy import select, func, or_

from app.core.database import get_db
from app.core.security import get_current_user
from app.models.knowledge_base import KnowledgeArticle
from app.models.user import User

router = APIRouter(tags=["knowledge-base"])


@router.get("/")
async def list_articles(
    category: str | None = None,
    search: str | None = None,
    page: int = Query(1, ge=1),
    page_size: int = Query(20, ge=1, le=100),
    db: AsyncSession = Depends(get_db),
    current_user: User = Depends(get_current_user),
):
    query = select(KnowledgeArticle).where(KnowledgeArticle.is_published == True)

    if category:
        query = query.where(KnowledgeArticle.category == category)
    if search:
        query = query.where(
            or_(
                KnowledgeArticle.title.ilike(f"%{search}%"),
                KnowledgeArticle.content.ilike(f"%{search}%"),
            )
        )

    total = await db.scalar(select(func.count()).select_from(query.subquery()))
    query = query.order_by(KnowledgeArticle.created_at.desc()).offset((page - 1) * page_size).limit(page_size)
    result = await db.execute(query)

    articles = []
    for article in result.scalars().all():
        articles.append({
            "id": article.id,
            "title": article.title,
            "slug": article.slug,
            "category": article.category,
            "tags": article.tags,
            "excerpt": article.excerpt,
            "view_count": article.view_count,
            "created_at": article.created_at.isoformat(),
        })

    return {"items": articles, "total": total or 0}


@router.get("/{slug}")
async def get_article(
    slug: str,
    db: AsyncSession = Depends(get_db),
    current_user: User = Depends(get_current_user),
):
    result = await db.execute(
        select(KnowledgeArticle).where(KnowledgeArticle.slug == slug)
    )
    article = result.scalar_one_or_none()
    if not article:
        raise HTTPException(status_code=404, detail="Article not found")

    article.view_count = (article.view_count or 0) + 1
    await db.commit()

    return {
        "id": article.id,
        "title": article.title,
        "slug": article.slug,
        "category": article.category,
        "tags": article.tags,
        "content": article.content,
        "author": article.author.full_name if article.author else None,
        "view_count": article.view_count,
        "version": article.version,
        "created_at": article.created_at.isoformat(),
        "updated_at": article.updated_at.isoformat() if article.updated_at else None,
    }
