"""initial schema

Revision ID: e9dcdaa66bae
Revises: 
Create Date: 2026-06-15 23:16:19.101887

"""
from typing import Sequence, Union

from alembic import op
import sqlalchemy as sa
from sqlalchemy.dialects import postgresql


revision: str = 'e9dcdaa66bae'
down_revision: Union[str, Sequence[str], None] = None
branch_labels: Union[str, Sequence[str], None] = None
depends_on: Union[str, Sequence[str], None] = None


def upgrade() -> None:
    op.create_table('users',
        sa.Column('id', sa.Integer(), autoincrement=True, nullable=False),
        sa.Column('email', sa.String(length=255), nullable=False),
        sa.Column('username', sa.String(length=100), nullable=False),
        sa.Column('hashed_password', sa.String(length=255), nullable=False),
        sa.Column('full_name', sa.String(length=255), nullable=False),
        sa.Column('phone', sa.String(length=20), nullable=True),
        sa.Column('role', sa.Enum('ADMIN', 'SALES', 'PRODUCTION', 'LOGISTICS', 'ACCOUNTING', 'PURCHASING', 'MANAGEMENT', name='userrole'), nullable=False),
        sa.Column('is_active', sa.Boolean(), nullable=True),
        sa.Column('is_superuser', sa.Boolean(), nullable=True),
        sa.Column('two_factor_enabled', sa.Boolean(), nullable=True),
        sa.Column('created_at', sa.DateTime(timezone=True), server_default=sa.func.now()),
        sa.Column('updated_at', sa.DateTime(timezone=True), onupdate=sa.func.now()),
        sa.PrimaryKeyConstraint('id'),
    )
    op.create_index('ix_users_email', 'users', ['email'], unique=True)
    op.create_index('ix_users_username', 'users', ['username'], unique=True)
    op.create_index('ix_users_id', 'users', ['id'])

    op.create_table('products',
        sa.Column('id', sa.Integer(), autoincrement=True, nullable=False),
        sa.Column('name', sa.String(length=255), nullable=False),
        sa.Column('slug', sa.String(length=255), nullable=False),
        sa.Column('category', sa.String(length=100), nullable=False),
        sa.Column('sort', sa.String(length=50), nullable=True),
        sa.Column('description', sa.Text(), nullable=True),
        sa.Column('full_description', sa.Text(), nullable=True),
        sa.Column('gost', sa.String(length=100), nullable=True),
        sa.Column('specifications', postgresql.JSON(), nullable=True),
        sa.Column('packaging', postgresql.JSON(), nullable=True),
        sa.Column('min_order', sa.Float(), nullable=True),
        sa.Column('unit', sa.String(length=20), nullable=True),
        sa.Column('price', sa.Float(), nullable=True),
        sa.Column('price_on_request', sa.Boolean(), nullable=True),
        sa.Column('application', sa.Text(), nullable=True),
        sa.Column('is_active', sa.Boolean(), nullable=True),
        sa.Column('sort_order', sa.Integer(), nullable=True),
        sa.Column('created_at', sa.DateTime(timezone=True), server_default=sa.func.now()),
        sa.Column('updated_at', sa.DateTime(timezone=True), onupdate=sa.func.now()),
        sa.PrimaryKeyConstraint('id'),
    )
    op.create_index('ix_products_slug', 'products', ['slug'], unique=True)
    op.create_index('ix_products_id', 'products', ['id'])

    op.create_table('clients',
        sa.Column('id', sa.Integer(), autoincrement=True, nullable=False),
        sa.Column('company_name', sa.String(length=255), nullable=False),
        sa.Column('inn', sa.String(length=12), nullable=True),
        sa.Column('kpp', sa.String(length=9), nullable=True),
        sa.Column('ogrn', sa.String(length=15), nullable=True),
        sa.Column('legal_address', sa.Text(), nullable=True),
        sa.Column('actual_address', sa.Text(), nullable=True),
        sa.Column('contact_person', sa.String(length=255), nullable=True),
        sa.Column('phone', sa.String(length=20), nullable=True),
        sa.Column('email', sa.String(length=255), nullable=True),
        sa.Column('website', sa.String(length=255), nullable=True),
        sa.Column('category', sa.String(length=50), nullable=True),
        sa.Column('status', sa.String(length=50), nullable=True),
        sa.Column('manager_id', sa.Integer(), nullable=True),
        sa.Column('discount', sa.Float(), nullable=True),
        sa.Column('credit_limit', sa.Float(), nullable=True),
        sa.Column('payment_deferral_days', sa.Integer(), nullable=True),
        sa.Column('balance', sa.Float(), nullable=True),
        sa.Column('notes', sa.Text(), nullable=True),
        sa.Column('source', sa.String(length=50), nullable=True),
        sa.Column('registered_at', sa.DateTime(timezone=True), server_default=sa.func.now()),
        sa.Column('created_at', sa.DateTime(timezone=True), server_default=sa.func.now()),
        sa.Column('updated_at', sa.DateTime(timezone=True), onupdate=sa.func.now()),
        sa.PrimaryKeyConstraint('id'),
        sa.ForeignKeyConstraint(['manager_id'], ['users.id']),
    )
    op.create_index('ix_clients_email', 'clients', ['email'])
    op.create_index('ix_clients_inn', 'clients', ['inn'])
    op.create_index('ix_clients_id', 'clients', ['id'])

    op.create_table('deals',
        sa.Column('id', sa.Integer(), autoincrement=True, nullable=False),
        sa.Column('client_id', sa.Integer(), nullable=False),
        sa.Column('manager_id', sa.Integer(), nullable=False),
        sa.Column('title', sa.String(length=255), nullable=False),
        sa.Column('stage', sa.String(length=50), nullable=True),
        sa.Column('amount', sa.Float(), nullable=True),
        sa.Column('discount', sa.Float(), nullable=True),
        sa.Column('products', postgresql.JSON(), nullable=True),
        sa.Column('delivery_type', sa.String(length=50), nullable=True),
        sa.Column('delivery_date', sa.DateTime(timezone=True), nullable=True),
        sa.Column('payment_terms', sa.String(length=100), nullable=True),
        sa.Column('source', sa.String(length=50), nullable=True),
        sa.Column('notes', sa.Text(), nullable=True),
        sa.Column('documents', postgresql.JSON(), nullable=True),
        sa.Column('closed_at', sa.DateTime(timezone=True), nullable=True),
        sa.Column('closed_reason', sa.String(length=255), nullable=True),
        sa.Column('created_at', sa.DateTime(timezone=True), server_default=sa.func.now()),
        sa.Column('updated_at', sa.DateTime(timezone=True), onupdate=sa.func.now()),
        sa.PrimaryKeyConstraint('id'),
        sa.ForeignKeyConstraint(['client_id'], ['clients.id']),
        sa.ForeignKeyConstraint(['manager_id'], ['users.id']),
    )
    op.create_index('ix_deals_id', 'deals', ['id'])

    op.create_table('orders',
        sa.Column('id', sa.Integer(), autoincrement=True, nullable=False),
        sa.Column('order_number', sa.String(length=50), nullable=False),
        sa.Column('client_id', sa.Integer(), nullable=False),
        sa.Column('deal_id', sa.Integer(), nullable=True),
        sa.Column('manager_id', sa.Integer(), nullable=True),
        sa.Column('status', sa.String(length=50), nullable=True),
        sa.Column('items', postgresql.JSON(), nullable=True),
        sa.Column('total_amount', sa.Float(), nullable=True),
        sa.Column('discount', sa.Float(), nullable=True),
        sa.Column('delivery_type', sa.String(length=50), nullable=True),
        sa.Column('delivery_address', sa.Text(), nullable=True),
        sa.Column('delivery_date', sa.DateTime(timezone=True), nullable=True),
        sa.Column('payment_status', sa.String(length=50), nullable=True),
        sa.Column('payment_date', sa.DateTime(timezone=True), nullable=True),
        sa.Column('documents', postgresql.JSON(), nullable=True),
        sa.Column('notes', sa.Text(), nullable=True),
        sa.Column('source', sa.String(length=50), nullable=True),
        sa.Column('created_at', sa.DateTime(timezone=True), server_default=sa.func.now()),
        sa.Column('updated_at', sa.DateTime(timezone=True), onupdate=sa.func.now()),
        sa.PrimaryKeyConstraint('id'),
        sa.ForeignKeyConstraint(['client_id'], ['clients.id']),
        sa.ForeignKeyConstraint(['deal_id'], ['deals.id']),
        sa.ForeignKeyConstraint(['manager_id'], ['users.id']),
    )
    op.create_index('ix_orders_order_number', 'orders', ['order_number'], unique=True)
    op.create_index('ix_orders_id', 'orders', ['id'])

    op.create_table('knowledge_articles',
        sa.Column('id', sa.Integer(), autoincrement=True, nullable=False),
        sa.Column('title', sa.String(length=255), nullable=False),
        sa.Column('slug', sa.String(length=255), nullable=False),
        sa.Column('category', sa.String(length=50), nullable=False),
        sa.Column('tags', postgresql.JSON(), nullable=True),
        sa.Column('content', sa.Text(), nullable=False),
        sa.Column('excerpt', sa.Text(), nullable=True),
        sa.Column('author_id', sa.Integer(), nullable=True),
        sa.Column('is_published', sa.Boolean(), nullable=True),
        sa.Column('is_restricted', sa.Boolean(), nullable=True),
        sa.Column('allowed_roles', postgresql.JSON(), nullable=True),
        sa.Column('view_count', sa.Integer(), nullable=True),
        sa.Column('version', sa.Integer(), nullable=True),
        sa.Column('created_at', sa.DateTime(timezone=True), server_default=sa.func.now()),
        sa.Column('updated_at', sa.DateTime(timezone=True), onupdate=sa.func.now()),
        sa.PrimaryKeyConstraint('id'),
        sa.ForeignKeyConstraint(['author_id'], ['users.id']),
    )
    op.create_index('ix_knowledge_articles_slug', 'knowledge_articles', ['slug'], unique=True)
    op.create_index('ix_knowledge_articles_id', 'knowledge_articles', ['id'])


def downgrade() -> None:
    op.drop_table('knowledge_articles')
    op.drop_table('orders')
    op.drop_table('deals')
    op.drop_table('clients')
    op.drop_table('products')
    op.drop_table('users')
    op.execute('DROP TYPE IF EXISTS userrole')
