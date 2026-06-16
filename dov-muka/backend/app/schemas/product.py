from pydantic import BaseModel
from datetime import datetime


class ProductBase(BaseModel):
    name: str
    slug: str
    category: str
    sort: str | None = None
    description: str | None = None
    gost: str | None = None
    specifications: dict | None = None
    packaging: dict | None = None
    min_order: float | None = None
    unit: str = "т"
    price: float | None = None
    price_on_request: bool = False
    application: str | None = None
    is_active: bool = True
    sort_order: int = 0


class ProductCreate(ProductBase):
    pass


class ProductUpdate(BaseModel):
    name: str | None = None
    slug: str | None = None
    category: str | None = None
    sort: str | None = None
    description: str | None = None
    gost: str | None = None
    specifications: dict | None = None
    packaging: dict | None = None
    min_order: float | None = None
    unit: str | None = None
    price: float | None = None
    price_on_request: bool | None = None
    application: str | None = None
    is_active: bool | None = None
    sort_order: int | None = None


class ProductResponse(ProductBase):
    id: int
    created_at: datetime
    updated_at: datetime | None

    model_config = {"from_attributes": True}


class ProductList(BaseModel):
    items: list[ProductResponse]
    total: int
