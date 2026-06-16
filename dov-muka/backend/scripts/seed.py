"""Seed database with initial data."""
import asyncio
from sqlalchemy import select
from app.core.database import async_session_factory, engine, Base
from app.core.security import get_password_hash
from app.models.user import User, UserRole
from app.models.product import Product
from app.models.knowledge_base import KnowledgeArticle


async def seed():
    async with engine.begin() as conn:
        await conn.run_sync(Base.metadata.create_all)

    async with async_session_factory() as db:
        existing = await db.execute(select(User).where(User.username == "admin"))
        if not existing.scalar_one_or_none():
            admin = User(
                email="admin@dov-muka.ru",
                username="admin",
                hashed_password=get_password_hash("admin123"),
                full_name="Администратор",
                role=UserRole.ADMIN,
                is_superuser=True,
            )
            db.add(admin)

            manager = User(
                email="sales@dov-muka.ru",
                username="manager",
                hashed_password=get_password_hash("manager123"),
                full_name="Владимир Борисов",
                role=UserRole.SALES,
                phone="+7 (846) 123-45-68",
            )
            db.add(manager)

        existing = await db.execute(select(Product).where(Product.slug == "muka-vysshiy-sort"))
        if not existing.scalar_one_or_none():
            products = [
                Product(
                    name="Мука пшеничная высшего сорта",
                    slug="muka-vysshiy-sort",
                    category="flour",
                    sort="Высший сорт",
                    description="Мука пшеничная высшего сорта для хлебобулочных и кондитерских изделий. Отличается высокой белизной и стабильным качеством.",
                    full_description="Мука высшего сорта производится из отборной пшеницы 3 класса. Подходит для выпечки хлеба, булочных изделий, пельменей, кондитерской продукции. Обеспечивает отличный объем и пористость выпечки.",
                    gost="ГОСТ Р 26574-2017",
                    specifications={
                        "Клейковина": "28-30%",
                        "Влажность": "≤ 14.5%",
                        "Зольность": "0.55%",
                        "Белизна": "58-62 ед.",
                        "Число падения": "≥ 200 с",
                    },
                    packaging={
                        "Мешки 50 кг": "Бумажные или полипропиленовые",
                        "Биг-бэги": "до 1 тонны",
                        "Насыпью": "муковозы",
                    },
                    min_order=1,
                    unit="т",
                    price=30000,
                    application="Кондитерские изделия, хлеб высших сортов, пельмени, премиальная выпечка",
                    sort_order=1,
                ),
                Product(
                    name="Мука пшеничная первого сорта",
                    slug="muka-pervyy-sort",
                    category="flour",
                    sort="Первый сорт",
                    description="Мука пшеничная первого сорта для массового хлебопечения. Оптимальное соотношение цены и качества.",
                    full_description="Мука первого сорта производится из пшеницы 3-4 класса. Широко применяется в хлебопекарной промышленности для производства массовых сортов хлеба.",
                    gost="ГОСТ Р 26574-2017",
                    specifications={
                        "Клейковина": "25-27%",
                        "Влажность": "≤ 14.5%",
                        "Зольность": "0.75%",
                        "Белизна": "48-52 ед.",
                        "Число падения": "≥ 200 с",
                    },
                    packaging={
                        "Мешки 50 кг": "Бумажные или полипропиленовые",
                        "Биг-бэги": "до 1 тонны",
                        "Насыпью": "муковозы",
                    },
                    min_order=1,
                    unit="т",
                    price=26500,
                    application="Массовый хлеб, выпечка, макароны, пищевые производства",
                    sort_order=2,
                ),
                Product(
                    name="Отруби пшеничные",
                    slug="otrubi-pshenichnye",
                    category="bran",
                    description="Отруби пшеничные — ценный кормовой продукт для сельского хозяйства.",
                    gost="ГОСТ 7169-2017",
                    specifications={
                        "Влажность": "≤ 14.5%",
                        "Клетчатка": "8-10%",
                        "Протеин": "14-16%",
                    },
                    packaging={
                        "Мешки 50 кг": "Полипропиленовые",
                        "Насыпью": "россыпью",
                    },
                    min_order=1,
                    unit="т",
                    price=8500,
                    application="Кормовая база для КРС, свиней, птицы. Пищевая промышленность",
                    sort_order=3,
                ),
                Product(
                    name="Зернопродукт",
                    slug="zernoprodukt",
                    category="grain",
                    description="Зернопродукт по ТУ 9295-001-00933855-04",
                    gost="ТУ 9295-001-00933855-04",
                    specifications={
                        "Влажность": "≤ 14%",
                        "Сорная примесь": "≤ 1%",
                    },
                    packaging={
                        "Мешки 50 кг": "Полипропиленовые",
                        "Биг-бэги": "до 1 тонны",
                    },
                    min_order=1,
                    unit="т",
                    price_on_request=True,
                    sort_order=4,
                ),
            ]
            for p in products:
                db.add(p)

        existing = await db.execute(select(KnowledgeArticle).where(KnowledgeArticle.slug == "skript-prodazh"))
        if not existing.scalar_one_or_none():
            articles = [
                KnowledgeArticle(
                    title="Скрипты продаж",
                    slug="skript-prodazh",
                    category="sales",
                    tags=["продажи", "скрипты", "телефонные звонки"],
                    content="""## Скрипт первичного звонка

### 1. Представление
- Добрый день! Меня зовут [Имя], я представляю ТД Шихобалов — крупнейший мукомольный завод Самарской области.

### 2. Выявление потребностей
- С каким объёмом муки вы работаете в месяц?
- Какой сорт муки используете?
- Кто ваш текущий поставщик?

### 3. Презентация
- Наша мощность — до 200 тонн в сутки
- Стабильное качество, подтверждённое ГОСТ

### 4. Работа с возражениями
- "Дорого" — мы предлагаем стабильное качество и надёжность поставок
- "Есть поставщик" — всегда полезно иметь резервного поставщика

### 5. Закрытие
- Я подготовлю коммерческое предложение. Какой email отправить?""",
                    excerpt="Скрипты для телефонных звонков и встреч с клиентами",
                    author_id=1,
                ),
                KnowledgeArticle(
                    title="Технические характеристики продукции",
                    slug="tekhnicheskie-harakteristiki",
                    category="products",
                    tags=["продукция", "характеристики", "ГОСТ"],
                    content="""## Мука пшеничная высший сорт
- Клейковина: 28-30%
- Влажность: ≤ 14.5%
- Зольность: 0.55%
- Белизна: 58-62 ед.

## Мука пшеничная первый сорт
- Клейковина: 25-27%
- Влажность: ≤ 14.5%
- Зольность: 0.75%
- Белизна: 48-52 ед.""",
                    excerpt="Полные технические характеристики всей продукции",
                    author_id=1,
                ),
                KnowledgeArticle(
                    title="Инструкция по работе с CRM",
                    slug="instruktsiya-crm",
                    category="training",
                    tags=["обучение", "CRM", "онбординг"],
                    content="""## Как создать сделку
1. Зайдите в раздел "Сделки"
2. Нажмите "Новая сделка"
3. Заполните поля: клиент, продукция, сумма
4. Нажмите "Создать"

## Как изменить статус заказа
1. Откройте заказ
2. Выберите новый статус из выпадающего списка
3. Система автоматически уведомит клиента""",
                    excerpt="Базовая инструкция по работе с CRM-системой",
                    author_id=1,
                ),
            ]
            for a in articles:
                db.add(a)

        await db.commit()
        print("Seed completed successfully!")


def main():
    asyncio.run(seed())

if __name__ == "__main__":
    main()
