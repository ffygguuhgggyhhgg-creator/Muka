from pydantic import BaseModel
from datetime import datetime


class OrderBase(BaseModel):
    client_id: int
    items: dict
    total_amount: float = 0
    delivery_type: str | None = None
    delivery_address: str | None = None
    delivery_date: datetime | None = None
    notes: str | None = None


class OrderCreate(OrderBase):
    pass


class OrderResponse(OrderBase):
    id: int
    order_number: str
    status: str
    payment_status: str
    created_at: datetime
    updated_at: datetime | None

    model_config = {"from_attributes": True}


class OrderList(BaseModel):
    items: list[OrderResponse]
    total: int
