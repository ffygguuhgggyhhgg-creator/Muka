import { useEffect, useState } from 'react'
import { Card, Row, Col, Statistic, Typography, Table, Tag, Spin } from 'antd'
import {
  ShoppingCartOutlined,
  TeamOutlined,
  DollarOutlined,
  RiseOutlined,
} from '@ant-design/icons'
import api from '../../services/api'

const { Title } = Typography

interface Order {
  id: number
  order_number: string
  client_id: number
  status: string
  total_amount: number
  created_at: string
}

interface Deal {
  id: number
  title: string
  stage: string
  amount: number
  created_at: string
}

const statusColors: Record<string, string> = {
  new: 'blue', processing: 'processing', production: 'orange',
  shipping: 'purple', delivered: 'green', cancelled: 'red',
}

const statusLabels: Record<string, string> = {
  new: 'Новый', processing: 'В обработке', production: 'В производстве',
  shipping: 'Отгружается', delivered: 'Доставлен', cancelled: 'Отменён',
}

export default function DashboardPage() {
  const [orders, setOrders] = useState<Order[]>([])
  const [deals, setDeals] = useState<Deal[]>([])
  const [clientsCount, setClientsCount] = useState(0)
  const [loading, setLoading] = useState(true)

  useEffect(() => {
    Promise.all([
      api.get('/orders', { params: { page_size: 5 } }),
      api.get('/deals', { params: { page_size: 100 } }),
      api.get('/clients', { params: { page_size: 1 } }),
    ]).then(([ordersRes, dealsRes, clientsRes]) => {
      setOrders(ordersRes.data.items)
      setDeals(dealsRes.data.items)
      setClientsCount(clientsRes.data.total)
    }).finally(() => setLoading(false))
  }, [])

  const activeDeals = deals.filter(d => !['lost', 'regular'].includes(d.stage))
  const totalDealsAmount = deals.reduce((sum, d) => sum + d.amount, 0)
  const conversion = deals.length > 0
    ? Math.round((deals.filter(d => d.stage === 'first_order' || d.stage === 'regular').length / deals.length) * 100)
    : 0

  const orderColumns = [
    { title: '№ Заказа', dataIndex: 'order_number', key: 'order_number' },
    {
      title: 'Статус', dataIndex: 'status', key: 'status',
      render: (s: string) => <Tag color={statusColors[s] || 'default'}>{statusLabels[s] || s}</Tag>,
    },
    {
      title: 'Сумма', dataIndex: 'total_amount', key: 'total_amount',
      render: (v: number) => `${v.toLocaleString()} ₽`,
    },
    { title: 'Дата', dataIndex: 'created_at', key: 'created_at', render: (v: string) => new Date(v).toLocaleDateString() },
  ]

  if (loading) return <Spin spinning style={{ display: 'block', margin: '100px auto' }} />

  return (
    <div>
      <Title level={3}>Дашборд</Title>
      <Row gutter={[16, 16]}>
        <Col xs={24} sm={12} md={6}>
          <Card>
            <Statistic
              title="Активные сделки"
              value={activeDeals.length}
              prefix={<ShoppingCartOutlined style={{ color: '#D4A843' }} />}
            />
          </Card>
        </Col>
        <Col xs={24} sm={12} md={6}>
          <Card>
            <Statistic
              title="Клиентов"
              value={clientsCount}
              prefix={<TeamOutlined style={{ color: '#D4A843' }} />}
            />
          </Card>
        </Col>
        <Col xs={24} sm={12} md={6}>
          <Card>
            <Statistic
              title="Сумма сделок"
              value={totalDealsAmount}
              prefix={<DollarOutlined style={{ color: '#52c41a' }} />}
              suffix="₽"
            />
          </Card>
        </Col>
        <Col xs={24} sm={12} md={6}>
          <Card>
            <Statistic
              title="Конверсия"
              value={conversion}
              suffix="%"
              prefix={<RiseOutlined style={{ color: '#1890ff' }} />}
            />
          </Card>
        </Col>
      </Row>
      <Row gutter={[16, 16]} style={{ marginTop: 24 }}>
        <Col xs={24} md={12}>
          <Card title="Последние заказы">
            <Table
              dataSource={orders}
              columns={orderColumns}
              rowKey="id"
              pagination={false}
              size="small"
            />
          </Card>
        </Col>
        <Col xs={24} md={12}>
          <Card title="Активные сделки">
            <Table
              dataSource={activeDeals.slice(0, 5)}
              columns={[
                { title: 'Название', dataIndex: 'title', key: 'title' },
                {
                  title: 'Сумма', dataIndex: 'amount', key: 'amount',
                  render: (v: number) => `${v.toLocaleString()} ₽`,
                },
              ]}
              rowKey="id"
              pagination={false}
              size="small"
            />
          </Card>
        </Col>
      </Row>
    </div>
  )
}
