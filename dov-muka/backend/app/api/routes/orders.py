from fastapi import APIRouter, Depends, HTTPException, Query
from sqlalchemy.ext.asyncio import AsyncSession
from sqlalchemy import select, func

from app.core.database import get_db
from app.core.security import get_current_user
from app.models.order import Order
from app.models.user import User
from app.schemas.order import OrderCreate, OrderResponse, OrderList
from app.services.order_service import generate_order_number

router = APIRouter(tags=["orders"])


@router.get("/", response_model=OrderList)
async def list_orders(
    search: str | None = None,
    status: str | None = None,
    client_id: int | None = None,
    page: int = Query(1, ge=1),
    page_size: int = Query(20, ge=1, le=100),
    db: AsyncSession = Depends(get_db),
    current_user: User = Depends(get_current_user),
):
    query = select(Order)
    if search:
        query = query.where(Order.order_number.ilike(f"%{search}%"))
    if status:
        query = query.where(Order.status == status)
    if client_id:
        query = query.where(Order.client_id == client_id)

    total = await db.scalar(select(func.count()).select_from(query.subquery()))
    query = query.order_by(Order.created_at.desc()).offset((page - 1) * page_size).limit(page_size)
    result = await db.execute(query)

    return OrderList(items=result.scalars().all(), total=total or 0)


@router.get("/{order_id}", response_model=OrderResponse)
async def get_order(
    order_id: int,
    db: AsyncSession = Depends(get_db),
    current_user: User = Depends(get_current_user),
):
    result = await db.execute(select(Order).where(Order.id == order_id))
    order = result.scalar_one_or_none()
    if not order:
        raise HTTPException(status_code=404, detail="Order not found")
    return order


@router.post("/", response_model=OrderResponse)
async def create_order(
    data: OrderCreate,
    db: AsyncSession = Depends(get_db),
    current_user: User = Depends(get_current_user),
):
    order = Order(
        **data.model_dump(),
        order_number=await generate_order_number(db),
        manager_id=current_user.id,
    )
    db.add(order)
    await db.commit()
    await db.refresh(order)
    return order
