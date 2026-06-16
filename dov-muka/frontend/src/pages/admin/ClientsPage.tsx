import { useEffect, useState } from 'react'
import { Table, Typography, Tag, Input, Button, Modal, Form, message, Space, Alert, Empty } from 'antd'
import { PlusOutlined, TeamOutlined } from '@ant-design/icons'
import api from '../../services/api'

const { Title } = Typography

interface Client {
  id: number
  company_name: string
  inn: string
  contact_person: string
  phone: string
  email: string
  status: string
  category: string
  discount: number
  balance: number
}

const statusColors: Record<string, string> = {
  new: 'blue',
  active: 'green',
  inactive: 'default',
  problematic: 'red',
}

export default function ClientsPage() {
  const [clients, setClients] = useState<Client[]>([])
  const [loading, setLoading] = useState(true)
  const [error, setError] = useState<string | null>(null)
  const [modalOpen, setModalOpen] = useState(false)
  const [search, setSearch] = useState('')
  const [form] = Form.useForm()

  const load = () => {
    setLoading(true)
    setError(null)
    api.get('/clients', { params: { search } })
      .then(({ data }) => setClients(data.items))
      .catch((err) => setError(err?.response?.data?.detail || 'Ошибка загрузки'))
      .finally(() => setLoading(false))
  }

  useEffect(() => { load() }, [search])

  const handleCreate = async (values: Record<string, string>) => {
    try {
      await api.post('/clients', values)
      message.success('Клиент создан')
      setModalOpen(false)
      form.resetFields()
      load()
    } catch (err: unknown) {
      const detail = (err as { response?: { data?: { detail?: string } } })?.response?.data?.detail || 'Ошибка создания'
      message.error(detail)
    }
  }

  const columns = [
    { title: 'Компания', dataIndex: 'company_name', key: 'company_name' },
    { title: 'ИНН', dataIndex: 'inn', key: 'inn' },
    { title: 'Контакт', dataIndex: 'contact_person', key: 'contact_person' },
    { title: 'Телефон', dataIndex: 'phone', key: 'phone' },
    {
      title: 'Статус',
      dataIndex: 'status',
      key: 'status',
      render: (s: string) => <Tag color={statusColors[s] || 'default'}>{s}</Tag>,
    },
    {
      title: 'Скидка',
      dataIndex: 'discount',
      key: 'discount',
      render: (v: number) => `${v}%`,
    },
    {
      title: 'Баланс',
      dataIndex: 'balance',
      key: 'balance',
      render: (v: number) => `${v.toLocaleString()} ₽`,
    },
  ]

  return (
    <div>
      <div style={{ display: 'flex', justifyContent: 'space-between', marginBottom: 16 }}>
        <Title level={3}><TeamOutlined /> Клиенты</Title>
        <Space>
          <Input.Search
            placeholder="Поиск..."
            value={search}
            onChange={(e) => setSearch(e.target.value)}
            allowClear
            style={{ width: 250 }}
          />
          <Button type="primary" icon={<PlusOutlined />} onClick={() => setModalOpen(true)}>
            Новый клиент
          </Button>
        </Space>
      </div>

      {error && <Alert type="error" message={error} style={{ marginBottom: 16 }} closable onClose={() => setError(null)} />}

      <Table
        dataSource={clients}
        columns={columns}
        rowKey="id"
        loading={loading}
        locale={{ emptyText: <Empty description="Нет клиентов" /> }}
      />

      <Modal
        title="Новый клиент"
        open={modalOpen}
        onCancel={() => setModalOpen(false)}
        onOk={() => form.submit()}
      >
        <Form form={form} layout="vertical" onFinish={handleCreate}>
          <Form.Item name="company_name" label="Компания" rules={[{ required: true }]}>
            <Input />
          </Form.Item>
          <Form.Item name="inn" label="ИНН"><Input /></Form.Item>
          <Form.Item name="contact_person" label="Контактное лицо"><Input /></Form.Item>
          <Form.Item name="phone" label="Телефон"><Input /></Form.Item>
          <Form.Item name="email" label="Email"><Input /></Form.Item>
        </Form>
      </Modal>
    </div>
  )
}
