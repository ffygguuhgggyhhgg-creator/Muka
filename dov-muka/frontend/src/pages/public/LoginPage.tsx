import { useEffect } from 'react'
import { useNavigate } from 'react-router-dom'
import { Card, Form, Input, Button, Typography, message } from 'antd'
import { UserOutlined, LockOutlined } from '@ant-design/icons'
import { useAuth } from '../../hooks/useAuth'

const { Title } = Typography

export default function LoginPage() {
  const { login, token } = useAuth()
  const navigate = useNavigate()

  useEffect(() => {
    if (token) navigate('/admin')
  }, [token, navigate])

  const handleSubmit = async (values: { username: string; password: string }) => {
    try {
      await login(values.username, values.password)
      message.success('Успешный вход')
      navigate('/admin')
    } catch {
      message.error('Неверные учётные данные')
    }
  }

  return (
    <div style={{
      display: 'flex',
      justifyContent: 'center',
      alignItems: 'center',
      minHeight: '60vh',
      padding: 40,
    }}>
      <Card style={{ width: 400 }}>
        <div style={{ textAlign: 'center', marginBottom: 24 }}>
          <Title level={3}>Вход в систему</Title>
          <img src="/logo.svg" alt="logo" height={48} />
        </div>
        <Form layout="vertical" onFinish={handleSubmit}>
          <Form.Item name="username" rules={[{ required: true, message: 'Введите логин' }]}>
            <Input prefix={<UserOutlined />} placeholder="Логин" size="large" />
          </Form.Item>
          <Form.Item name="password" rules={[{ required: true, message: 'Введите пароль' }]}>
            <Input.Password prefix={<LockOutlined />} placeholder="Пароль" size="large" />
          </Form.Item>
          <Button type="primary" htmlType="submit" size="large" block>
            Войти
          </Button>
        </Form>
      </Card>
    </div>
  )
}
