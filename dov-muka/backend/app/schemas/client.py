from pydantic import BaseModel
from datetime import datetime


class ClientBase(BaseModel):
    company_name: str
    inn: str | None = None
    kpp: str | None = None
    contact_person: str | None = None
    phone: str | None = None
    email: str | None = None
    category: str = "wholesale"
    status: str = "new"
    notes: str | None = None


class ClientCreate(ClientBase):
    pass


class ClientUpdate(BaseModel):
    company_name: str | None = None
    inn: str | None = None
    kpp: str | None = None
    contact_person: str | None = None
    phone: str | None = None
    email: str | None = None
    category: str | None = None
    status: str | None = None
    notes: str | None = None


class ClientResponse(ClientBase):
    id: int
    manager_id: int | None
    discount: float
    balance: float
    registered_at: datetime
    created_at: datetime

    model_config = {"from_attributes": True}


class ClientList(BaseModel):
    items: list[ClientResponse]
    total: int
