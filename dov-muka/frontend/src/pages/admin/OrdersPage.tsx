import { useEffect, useState } from 'react'
import { Table, Typography, Tag, Space, Input, Alert, Empty } from 'antd'
import api from '../../services/api'

const { Title } = Typography

interface Order {
  id: number
  order_number: string
  client_id: number
  status: string
  total_amount: number
  payment_status: string
  delivery_type: string
  created_at: string
}

const statusColors: Record<string, string> = {
  new: 'blue',
  processing: 'processing',
  production: 'orange',
  shipping: 'purple',
  delivered: 'green',
  cancelled: 'red',
}

const statusLabels: Record<string, string> = {
  new: 'Новый',
  processing: 'В обработке',
  production: 'В производстве',
  shipping: 'Отгружается',
  delivered: 'Доставлен',
  cancelled: 'Отменён',
}

export default function OrdersPage() {
  const [orders, setOrders] = useState<Order[]>([])
  const [loading, setLoading] = useState(true)
  const [error, setError] = useState<string | null>(null)
  const [search, setSearch] = useState('')

  useEffect(() => {
    setLoading(true)
    setError(null)
    const params: Record<string, string | number> = { page_size: 50 }
    if (search) params.search = search
    api.get('/orders', { params })
      .then(({ data }) => setOrders(data.items))
      .catch((err) => setError(err?.response?.data?.detail || 'Ошибка загрузки'))
      .finally(() => setLoading(false))
  }, [search])

  const columns = [
    { title: '№ Заказа', dataIndex: 'order_number', key: 'order_number' },
    { title: 'Клиент ID', dataIndex: 'client_id', key: 'client_id' },
    {
      title: 'Статус',
      dataIndex: 'status',
      key: 'status',
      render: (s: string) => <Tag color={statusColors[s] || 'default'}>{statusLabels[s] || s}</Tag>,
    },
    {
      title: 'Сумма',
      dataIndex: 'total_amount',
      key: 'total_amount',
      render: (v: number) => `${v.toLocaleString()} ₽`,
    },
    {
      title: 'Оплата',
      dataIndex: 'payment_status',
      key: 'payment_status',
      render: (s: string) => (
        <Tag color={s === 'paid' ? 'green' : s === 'pending' ? 'orange' : 'red'}>
          {s === 'paid' ? 'Оплачен' : s === 'pending' ? 'Ожидание' : 'Просрочен'}
        </Tag>
      ),
    },
    { title: 'Доставка', dataIndex: 'delivery_type', key: 'delivery_type' },
    { title: 'Создан', dataIndex: 'created_at', key: 'created_at', render: (v: string) => new Date(v).toLocaleDateString() },
  ]

  return (
    <div>
      <div style={{ display: 'flex', justifyContent: 'space-between', marginBottom: 16 }}>
        <Title level={3}>Заказы</Title>
        <Input.Search
          placeholder="Поиск по номеру..."
          value={search}
          onChange={(e) => setSearch(e.target.value)}
          allowClear
          style={{ width: 250 }}
        />
      </div>

      {error && <Alert type="error" message={error} style={{ marginBottom: 16 }} closable onClose={() => setError(null)} />}

      <Table
        dataSource={orders}
        columns={columns}
        rowKey="id"
        loading={loading}
        locale={{ emptyText: <Empty description="Нет заказов" /> }}
      />
    </div>
  )
}
