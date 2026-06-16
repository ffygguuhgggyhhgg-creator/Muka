import { Typography, Card, Row, Col, Form, Input, Button, message } from 'antd'
import { PhoneOutlined, MailOutlined, EnvironmentOutlined, ClockCircleOutlined } from '@ant-design/icons'
import api from '../../services/api'

const { Title, Paragraph } = Typography

export default function ContactsPage() {
  const [form] = Form.useForm()

  const handleSubmit = async (values: Record<string, string>) => {
    try {
      await api.post('/clients', values)
      message.success('Заявка отправлена! Мы свяжемся с вами.')
      form.resetFields()
    } catch {
      message.error('Ошибка отправки. Попробуйте позже.')
    }
  }

  return (
    <div style={{ padding: '40px', maxWidth: 1200, margin: '0 auto' }}>
      <Title>Контакты</Title>

      <Row gutter={[32, 32]}>
        <Col xs={24} md={12}>
          <Card>
            <div style={{ marginBottom: 24 }}>
              <PhoneOutlined style={{ color: '#D4A843', fontSize: 20, marginRight: 8 }} />
              <strong>Телефон:</strong> +7 (846) 123-45-67
            </div>
            <div style={{ marginBottom: 24 }}>
              <MailOutlined style={{ color: '#D4A843', fontSize: 20, marginRight: 8 }} />
              <strong>Email:</strong> info@dov-muka.ru
            </div>
            <div style={{ marginBottom: 24 }}>
              <EnvironmentOutlined style={{ color: '#D4A843', fontSize: 20, marginRight: 8 }} />
              <strong>Адрес:</strong> 443000, г. Самара, ул. Заводская, 1
            </div>
            <div style={{ marginBottom: 24 }}>
              <ClockCircleOutlined style={{ color: '#D4A843', fontSize: 20, marginRight: 8 }} />
              <strong>Режим работы:</strong> Пн-Пт 8:00 - 17:00
            </div>
            <div style={{ marginTop: 24, padding: 16, background: '#fafafa', borderRadius: 8 }}>
              <Title level={5}>Отдел продаж</Title>
              <Paragraph>Владимир Борисов — руководитель отдела продаж</Paragraph>
              <Paragraph>Тел: +7 (846) 123-45-68</Paragraph>
            </div>
          </Card>
        </Col>

        <Col xs={24} md={12}>
          <Card title="Отправить заявку">
            <Form
              form={form}
              layout="vertical"
              onFinish={handleSubmit}
            >
              <Form.Item name="company_name" label="Компания" rules={[{ required: true }]}>
                <Input />
              </Form.Item>
              <Form.Item name="contact_person" label="Контактное лицо" rules={[{ required: true }]}>
                <Input />
              </Form.Item>
              <Form.Item name="phone" label="Телефон" rules={[{ required: true }]}>
                <Input />
              </Form.Item>
              <Form.Item name="email" label="Email">
                <Input />
              </Form.Item>
              <Form.Item name="notes" label="Сообщение">
                <Input.TextArea rows={4} />
              </Form.Item>
              <Button type="primary" htmlType="submit" size="large" block>
                Отправить
              </Button>
            </Form>
          </Card>
        </Col>
      </Row>
    </div>
  )
}
