import { Link } from 'react-router-dom'
import { Layout, Menu, Button } from 'antd'
import { PhoneOutlined } from '@ant-design/icons'

const { Header } = Layout

const menuItems = [
  { key: '/', label: <Link to="/">Главная</Link> },
  { key: '/catalog', label: <Link to="/catalog">Каталог</Link> },
  { key: '/about', label: <Link to="/about">О компании</Link> },
  { key: '/contacts', label: <Link to="/contacts">Контакты</Link> },
]

export default function PublicHeader() {
  return (
    <Header style={{
      background: '#fff',
      display: 'flex',
      alignItems: 'center',
      justifyContent: 'space-between',
      borderBottom: '1px solid #f0f0f0',
      height: 72,
      padding: '0 40px',
    }}>
      <div style={{ display: 'flex', alignItems: 'center', gap: 8 }}>
        <img src="/logo.svg" alt="ТД Шихобалова" height={40} />
        <div>
          <div style={{ fontWeight: 700, fontSize: 16, color: '#D4A843' }}>
            ТД Шихобалова
          </div>
          <div style={{ fontSize: 11, color: '#999' }}>
            Мукомольный завод
          </div>
        </div>
      </div>

      <Menu
        mode="horizontal"
        items={menuItems}
        style={{ border: 'none', flex: 1, justifyContent: 'center', minWidth: 400 }}
      />

      <div style={{ display: 'flex', alignItems: 'center', gap: 16 }}>
        <span style={{ color: '#D4A843', fontWeight: 600 }}>
          <PhoneOutlined /> +7 (846) 123-45-67
        </span>
        <Link to="/login">
          <Button type="primary" ghost>Войти</Button>
        </Link>
      </div>
    </Header>
  )
}
