import { Typography, Button, Card, Row, Col, Statistic, Space } from 'antd'
import { Link } from 'react-router-dom'
import {
  ShoppingCartOutlined,
  SafetyOutlined,
  CarOutlined,
  TeamOutlined,
} from '@ant-design/icons'

const { Title, Paragraph } = Typography

const advantages = [
  {
    icon: <SafetyOutlined style={{ fontSize: 36, color: '#D4A843' }} />,
    title: 'Качество ГОСТ',
    desc: 'Вся продукция сертифицирована и соответствует ГОСТ',
  },
  {
    icon: <CarOutlined style={{ fontSize: 36, color: '#D4A843' }} />,
    title: 'Собственная логистика',
    desc: 'Парк техники и речной причал для отгрузки',
  },
  {
    icon: <TeamOutlined style={{ fontSize: 36, color: '#D4A843' }} />,
    title: 'Более 20 лет на рынке',
    desc: 'Надёжный поставщик муки в Поволжье',
  },
]

export default function HomePage() {
  return (
    <div>
      <div style={{
        background: 'linear-gradient(135deg, #D4A843 0%, #F5E6C8 100%)',
        padding: '80px 40px',
        textAlign: 'center',
      }}>
        <Title style={{ fontSize: 48, margin: 0, color: '#1a1a2e' }}>
          Крупнейший мукомольный завод Самарской области
        </Title>
        <Paragraph style={{ fontSize: 18, color: '#333', marginTop: 16, maxWidth: 600, margin: '16px auto' }}>
          Производим до 200 тонн муки и 70 тонн отрубей в сутки.
          Работаем с 2004 года.
        </Paragraph>
        <Space size="large" style={{ marginTop: 32 }}>
          <Link to="/catalog">
            <Button type="primary" size="large" icon={<ShoppingCartOutlined />}>
              Каталог продукции
            </Button>
          </Link>
          <Link to="/contacts">
            <Button size="large">Стать партнёром</Button>
          </Link>
        </Space>
      </div>

      <div style={{ padding: '60px 40px', background: '#fff' }}>
        <Row gutter={[48, 32]} justify="center">
          {advantages.map((adv) => (
            <Col xs={24} sm={12} md={8} key={adv.title}>
              <Card style={{ textAlign: 'center', border: 'none' }}>
                {adv.icon}
                <Title level={4} style={{ marginTop: 16 }}>{adv.title}</Title>
                <Paragraph style={{ color: '#666' }}>{adv.desc}</Paragraph>
              </Card>
            </Col>
          ))}
        </Row>
      </div>

      <div style={{
        background: '#1a1a2e',
        padding: '60px 40px',
        color: '#fff',
        textAlign: 'center',
      }}>
        <Title style={{ color: '#D4A843' }}>Наши показатели</Title>
        <Row gutter={[32, 24]} justify="center" style={{ marginTop: 32 }}>
          <Col xs={12} md={6}>
            <Statistic
              title={<span style={{ color: '#ccc' }}>Производство муки</span>}
              value={200}
              suffix="т/сут"
              valueStyle={{ color: '#D4A843', fontSize: 32 }}
            />
          </Col>
          <Col xs={12} md={6}>
            <Statistic
              title={<span style={{ color: '#ccc' }}>Производство отрубей</span>}
              value={70}
              suffix="т/сут"
              valueStyle={{ color: '#D4A843', fontSize: 32 }}
            />
          </Col>
          <Col xs={12} md={6}>
            <Statistic
              title={<span style={{ color: '#ccc' }}>Хранение зерна</span>}
              value={50}
              suffix="тыс. т"
              valueStyle={{ color: '#D4A843', fontSize: 32 }}
            />
          </Col>
          <Col xs={12} md={6}>
            <Statistic
              title={<span style={{ color: '#ccc' }}>Лет на рынке</span>}
              value={20}
              suffix="+"
              valueStyle={{ color: '#D4A843', fontSize: 32 }}
            />
          </Col>
        </Row>
      </div>

      <div style={{ padding: '60px 40px', textAlign: 'center', background: '#fff' }}>
        <Title level={2}>Готовы начать сотрудничество?</Title>
        <Paragraph style={{ fontSize: 16, color: '#666' }}>
          Оставьте заявку, и наш менеджер свяжется с вами в течение часа
        </Paragraph>
        <Link to="/contacts">
          <Button type="primary" size="large">Связаться с нами</Button>
        </Link>
      </div>
    </div>
  )
}
