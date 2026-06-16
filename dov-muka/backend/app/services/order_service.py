from sqlalchemy.ext.asyncio import AsyncSession
from sqlalchemy import select, func
from datetime import datetime

from app.models.order import Order


async def generate_order_number(db: AsyncSession) -> str:
    today = datetime.utcnow()
    date_prefix = today.strftime("%Y%m%d")
    result = await db.execute(
        select(func.count()).select_from(Order).where(
            Order.order_number.like(f"{date_prefix}-%")
        )
    )
    count = result.scalar() or 0
    return f"{date_prefix}-{count + 1:04d}"
