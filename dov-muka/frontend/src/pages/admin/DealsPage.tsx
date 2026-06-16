import { useEffect, useState } from 'react'
import { Table, Typography, Tag, Button, Modal, Form, Input, InputNumber, Select, message, Space, Alert, Empty } from 'antd'
import { PlusOutlined } from '@ant-design/icons'
import api from '../../services/api'

const { Title } = Typography

interface Deal {
  id: number
  title: string
  client_id: number
  amount: number
  discount: number
  stage: string
  delivery_type: string
  created_at: string
}

const stageColors: Record<string, string> = {
  new_lead: 'blue',
  qualification: 'cyan',
  proposal: 'gold',
  negotiation: 'orange',
  contract: 'purple',
  first_order: 'geekblue',
  regular: 'green',
  lost: 'red',
}

const stageLabels: Record<string, string> = {
  new_lead: 'Новый лид',
  qualification: 'Квалификация',
  proposal: 'КП',
  negotiation: 'Переговоры',
  contract: 'Договор',
  first_order: 'Первый заказ',
  regular: 'Постоянный',
  lost: 'Потерян',
}

export default function DealsPage() {
  const [deals, setDeals] = useState<Deal[]>([])
  const [loading, setLoading] = useState(true)
  const [error, setError] = useState<string | null>(null)
  const [modalOpen, setModalOpen] = useState(false)
  const [form] = Form.useForm()

  const load = () => {
    setLoading(true)
    setError(null)
    api.get('/deals')
      .then(({ data }) => setDeals(data.items))
      .catch((err) => setError(err?.response?.data?.detail || 'Ошибка загрузки'))
      .finally(() => setLoading(false))
  }

  useEffect(() => { load() }, [])

  const handleCreate = async (values: Record<string, unknown>) => {
    try {
      await api.post('/deals', values)
      message.success('Сделка создана')
      setModalOpen(false)
      form.resetFields()
      load()
    } catch (err: unknown) {
      const detail = (err as { response?: { data?: { detail?: string } } })?.response?.data?.detail || 'Ошибка создания'
      message.error(detail)
    }
  }

  const handleStageChange = async (dealId: number, stage: string) => {
    try {
      await api.patch(`/deals/${dealId}/stage?stage=${stage}`)
      message.success('Статус обновлён')
      load()
    } catch {
      message.error('Ошибка обновления статуса')
    }
  }

  const columns = [
    { title: 'Название', dataIndex: 'title', key: 'title' },
    { title: 'Клиент ID', dataIndex: 'client_id', key: 'client_id' },
    {
      title: 'Сумма',
      dataIndex: 'amount',
      key: 'amount',
      render: (v: number) => `${v.toLocaleString()} ₽`,
    },
    {
      title: 'Этап',
      dataIndex: 'stage',
      key: 'stage',
      render: (s: string, record: Deal) => (
        <Select
          value={s}
          onChange={(v) => handleStageChange(record.id, v)}
          style={{ width: 140 }}
          options={Object.entries(stageLabels).map(([value, label]) => ({ value, label }))}
        />
      ),
    },
    { title: 'Доставка', dataIndex: 'delivery_type', key: 'delivery_type' },
    { title: 'Создана', dataIndex: 'created_at', key: 'created_at', render: (v: string) => new Date(v).toLocaleDateString() },
  ]

  return (
    <div>
      <div style={{ display: 'flex', justifyContent: 'space-between', marginBottom: 16 }}>
        <Title level={3}>Сделки</Title>
        <Button type="primary" icon={<PlusOutlined />} onClick={() => setModalOpen(true)}>
          Новая сделка
        </Button>
      </div>

      {error && <Alert type="error" message={error} style={{ marginBottom: 16 }} closable onClose={() => setError(null)} />}

      <Table
        dataSource={deals}
        columns={columns}
        rowKey="id"
        loading={loading}
        locale={{ emptyText: <Empty description="Нет сделок" /> }}
      />

      <Modal
        title="Новая сделка"
        open={modalOpen}
        onCancel={() => setModalOpen(false)}
        onOk={() => form.submit()}
      >
        <Form form={form} layout="vertical" onFinish={handleCreate}>
          <Form.Item name="client_id" label="ID клиента" rules={[{ required: true }]}>
            <InputNumber style={{ width: '100%' }} />
          </Form.Item>
          <Form.Item name="title" label="Название" rules={[{ required: true }]}>
            <Input />
          </Form.Item>
          <Form.Item name="amount" label="Сумма">
            <InputNumber style={{ width: '100%' }} />
          </Form.Item>
          <Form.Item name="delivery_type" label="Тип доставки">
            <Select options={[
              { value: 'pickup', label: 'Самовывоз' },
              { value: 'auto', label: 'Автотранспорт' },
              { value: 'river', label: 'Речной транспорт' },
            ]} />
          </Form.Item>
        </Form>
      </Modal>
    </div>
  )
}
