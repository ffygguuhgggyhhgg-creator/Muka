import { useEffect, useState } from 'react'
import { Table, Typography, Button, Modal, Form, Input, InputNumber, Select, message, Space, Popconfirm, Alert, Empty } from 'antd'
import { PlusOutlined, EditOutlined, DeleteOutlined, ShoppingOutlined } from '@ant-design/icons'
import api from '../../services/api'

const { Title } = Typography

interface Product {
  id: number
  name: string
  slug: string
  description: string | null
  price: number | null
  unit: string
  category: string
  min_order: number | null
}

const categoryOptions = [
  { value: 'flour', label: 'Мука' },
  { value: 'bran', label: 'Отруби' },
  { value: 'grain', label: 'Зерно' },
  { value: 'other', label: 'Прочее' },
]

export default function ProductsPage() {
  const [products, setProducts] = useState<Product[]>([])
  const [loading, setLoading] = useState(true)
  const [error, setError] = useState<string | null>(null)
  const [modalOpen, setModalOpen] = useState(false)
  const [editingProduct, setEditingProduct] = useState<Product | null>(null)
  const [form] = Form.useForm()

  const load = () => {
    setLoading(true)
    setError(null)
    api.get('/products')
      .then(({ data }) => setProducts(data.items))
      .catch((err) => setError(err?.response?.data?.detail || 'Ошибка загрузки товаров'))
      .finally(() => setLoading(false))
  }

  useEffect(() => { load() }, [])

  const openCreate = () => {
    setEditingProduct(null)
    form.resetFields()
    setModalOpen(true)
  }

  const openEdit = (product: Product) => {
    setEditingProduct(product)
    form.setFieldsValue(product)
    setModalOpen(true)
  }

  const handleSubmit = async (values: Record<string, unknown>) => {
    try {
      if (editingProduct) {
        await api.put(`/products/${editingProduct.id}`, values)
        message.success('Товар обновлён')
      } else {
        await api.post('/products', values)
        message.success('Товар создан')
      }
      setModalOpen(false)
      form.resetFields()
      load()
    } catch (err: unknown) {
      const detail = (err as { response?: { data?: { detail?: string } } })?.response?.data?.detail || 'Ошибка сохранения'
      message.error(detail)
    }
  }

  const handleDelete = async (id: number) => {
    try {
      await api.delete(`/products/${id}`)
      message.success('Товар удалён')
      load()
    } catch {
      message.error('Ошибка удаления')
    }
  }

  const columns = [
    { title: 'Название', dataIndex: 'name', key: 'name' },
    { title: 'Slug', dataIndex: 'slug', key: 'slug' },
    { title: 'Категория', dataIndex: 'category', key: 'category' },
    { title: 'Цена', dataIndex: 'price', key: 'price', render: (v: number | null) => v ? `${v} ₽` : '—' },
    { title: 'Ед. изм.', dataIndex: 'unit', key: 'unit' },
    { title: 'Мин. заказ', dataIndex: 'min_order', key: 'min_order', render: (v: number | null) => v ?? '—' },
    {
      title: 'Действия',
      key: 'actions',
      render: (_: unknown, record: Product) => (
        <Space>
          <Button size="small" icon={<EditOutlined />} onClick={() => openEdit(record)} />
          <Popconfirm title="Удалить товар?" onConfirm={() => handleDelete(record.id)}>
            <Button size="small" danger icon={<DeleteOutlined />} />
          </Popconfirm>
        </Space>
      ),
    },
  ]

  return (
    <div>
      <div style={{ display: 'flex', justifyContent: 'space-between', marginBottom: 16 }}>
        <Title level={3}><ShoppingOutlined /> Товары</Title>
        <Button type="primary" icon={<PlusOutlined />} onClick={openCreate}>
          Новый товар
        </Button>
      </div>

      {error && <Alert type="error" message={error} style={{ marginBottom: 16 }} closable onClose={() => setError(null)} />}

      <Table
        dataSource={products}
        columns={columns}
        rowKey="id"
        loading={loading}
        locale={{ emptyText: <Empty description="Нет товаров" /> }}
      />

      <Modal
        title={editingProduct ? 'Редактировать товар' : 'Новый товар'}
        open={modalOpen}
        onCancel={() => setModalOpen(false)}
        onOk={() => form.submit()}
        width={640}
      >
        <Form form={form} layout="vertical" onFinish={handleSubmit}>
          <Form.Item name="name" label="Название" rules={[{ required: true }]}>
            <Input />
          </Form.Item>
          <Form.Item name="slug" label="Slug" rules={[{ required: true }]}>
            <Input />
          </Form.Item>
          <Form.Item name="category" label="Категория" rules={[{ required: true }]}>
            <Select options={categoryOptions} />
          </Form.Item>
          <Form.Item name="description" label="Описание">
            <Input.TextArea rows={3} />
          </Form.Item>
          <Form.Item name="price" label="Цена">
            <InputNumber style={{ width: '100%' }} />
          </Form.Item>
          <Form.Item name="unit" label="Единица измерения">
            <Input />
          </Form.Item>
          <Form.Item name="min_order" label="Мин. заказ">
            <InputNumber style={{ width: '100%' }} />
          </Form.Item>
        </Form>
      </Modal>
    </div>
  )
}
