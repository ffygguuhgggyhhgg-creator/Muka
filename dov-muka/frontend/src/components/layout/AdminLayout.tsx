import { useEffect } from 'react'
import { Outlet, useNavigate, Link } from 'react-router-dom'
import { Layout, Menu, Button } from 'antd'
import {
  DashboardOutlined,
  TeamOutlined,
  ShoppingCartOutlined,
  BookOutlined,
  LogoutOutlined,
  ShopOutlined,
} from '@ant-design/icons'
import { useAuth } from '../../hooks/useAuth'

const { Sider, Content } = Layout

const menuItems = [
  { key: '/admin', icon: <DashboardOutlined />, label: <Link to="/admin">Дашборд</Link> },
  { key: '/admin/clients', icon: <TeamOutlined />, label: <Link to="/admin/clients">Клиенты</Link> },
  { key: '/admin/deals', icon: <ShoppingCartOutlined />, label: <Link to="/admin/deals">Сделки</Link> },
  { key: '/admin/orders', icon: <ShoppingCartOutlined />, label: <Link to="/admin/orders">Заказы</Link> },
  { key: '/admin/knowledge-base', icon: <BookOutlined />, label: <Link to="/admin/knowledge-base">База знаний</Link> },
  { key: '/admin/products', icon: <ShopOutlined />, label: <Link to="/admin/products">Товары</Link> },
]

export default function AdminLayout() {
  const { user, token, loadUser, logout } = useAuth()
  const navigate = useNavigate()

  useEffect(() => {
    if (token && !user) {
      loadUser()
    }
  }, [token, user, loadUser])

  if (!token) {
    navigate('/login')
    return null
  }

  return (
    <Layout style={{ minHeight: '100vh' }}>
      <Sider theme="dark" width={240}>
        <div style={{
          padding: '16px 24px',
          color: '#D4A843',
          fontWeight: 700,
          fontSize: 16,
          borderBottom: '1px solid #333',
        }}>
          ТД Шихобалова
          <div style={{ fontSize: 11, color: '#666', fontWeight: 400 }}>
            {user?.full_name} ({user?.role})
          </div>
        </div>
        <Menu
          theme="dark"
          mode="inline"
          items={menuItems}
        />
        <div style={{ padding: 16, position: 'absolute', bottom: 0, width: '100%' }}>
          <Button
            type="text"
            icon={<LogoutOutlined />}
            onClick={() => { logout(); navigate('/') }}
            style={{ color: '#ff4d4f', width: '100%', textAlign: 'left' }}
          >
            Выйти
          </Button>
        </div>
      </Sider>
      <Content style={{ padding: 24, background: '#f5f5f5' }}>
        <Outlet />
      </Content>
    </Layout>
  )
}
