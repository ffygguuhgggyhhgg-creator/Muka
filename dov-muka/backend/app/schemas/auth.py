from pydantic import BaseModel, EmailStr


class LoginRequest(BaseModel):
    username: str
    password: str


class TokenResponse(BaseModel):
    access_token: str
    refresh_token: str
    token_type: str = "bearer"


class RegisterRequest(BaseModel):
    email: EmailStr
    username: str
    password: str
    full_name: str
    phone: str | None = None


class UserResponse(BaseModel):
    id: int
    email: str
    username: str
    full_name: str
    phone: str | None
    role: str
    is_active: bool

    model_config = {"from_attributes": True}
