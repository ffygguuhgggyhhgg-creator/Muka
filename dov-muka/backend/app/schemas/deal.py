from pydantic import BaseModel
from datetime import datetime


class DealBase(BaseModel):
    client_id: int
    title: str
    stage: str = "new_lead"
    amount: float = 0
    discount: float = 0
    products: dict | None = None
    delivery_type: str | None = None
    notes: str | None = None


class DealCreate(DealBase):
    pass


class DealResponse(DealBase):
    id: int
    manager_id: int
    source: str
    created_at: datetime
    updated_at: datetime | None

    model_config = {"from_attributes": True}


class DealList(BaseModel):
    items: list[DealResponse]
    total: int
