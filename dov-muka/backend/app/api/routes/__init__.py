from app.api.routes.auth import router as auth_router
from app.api.routes.products import router as products_router
from app.api.routes.clients import router as clients_router
from app.api.routes.deals import router as deals_router
from app.api.routes.orders import router as orders_router
from app.api.routes.knowledge_base import router as kb_router

routers = [
    (auth_router, "/auth", ["auth"]),
    (products_router, "/products", ["products"]),
    (clients_router, "/clients", ["clients"]),
    (deals_router, "/deals", ["deals"]),
    (orders_router, "/orders", ["orders"]),
    (kb_router, "/knowledge-base", ["knowledge-base"]),
]
