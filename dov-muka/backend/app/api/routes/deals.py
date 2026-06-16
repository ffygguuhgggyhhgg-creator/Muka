from fastapi import APIRouter, Depends, HTTPException, Query
from sqlalchemy.ext.asyncio import AsyncSession
from sqlalchemy import select, func

from app.core.database import get_db
from app.core.security import get_current_user
from app.models.deal import Deal
from app.models.user import User
from app.schemas.deal import DealCreate, DealResponse, DealList

router = APIRouter(tags=["deals"])


@router.get("/", response_model=DealList)
async def list_deals(
    stage: str | None = None,
    client_id: int | None = None,
    page: int = Query(1, ge=1),
    page_size: int = Query(20, ge=1, le=100),
    db: AsyncSession = Depends(get_db),
    current_user: User = Depends(get_current_user),
):
    query = select(Deal)
    if stage:
        query = query.where(Deal.stage == stage)
    if client_id:
        query = query.where(Deal.client_id == client_id)

    total = await db.scalar(select(func.count()).select_from(query.subquery()))
    query = query.order_by(Deal.created_at.desc()).offset((page - 1) * page_size).limit(page_size)
    result = await db.execute(query)

    return DealList(items=result.scalars().all(), total=total or 0)


@router.post("/", response_model=DealResponse)
async def create_deal(
    data: DealCreate,
    db: AsyncSession = Depends(get_db),
    current_user: User = Depends(get_current_user),
):
    deal = Deal(**data.model_dump(), manager_id=current_user.id)
    db.add(deal)
    await db.commit()
    await db.refresh(deal)
    return deal


@router.patch("/{deal_id}/stage")
async def update_deal_stage(
    deal_id: int,
    stage: str,
    db: AsyncSession = Depends(get_db),
    current_user: User = Depends(get_current_user),
):
    result = await db.execute(select(Deal).where(Deal.id == deal_id))
    deal = result.scalar_one_or_none()
    if not deal:
        raise HTTPException(status_code=404, detail="Deal not found")
    deal.stage = stage
    await db.commit()
    return {"ok": True}
