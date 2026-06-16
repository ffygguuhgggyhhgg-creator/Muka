import { Typography, Card, Row, Col } from 'antd'
import {
  ShopOutlined,
  SafetyOutlined,
  CarOutlined,
  ContainerOutlined,
} from '@ant-design/icons'

const { Title, Paragraph } = Typography

export default function AboutPage() {
  return (
    <div style={{ padding: '40px', maxWidth: 1000, margin: '0 auto' }}>
      <Title>О компании</Title>
      <Paragraph style={{ fontSize: 16 }}>
        ООО "ТД Шихобалова" — крупнейший мукомольный завод Самарской области.
        Основан в 2004 году. За годы работы мы зарекомендовали себя как
        надёжный поставщик высококачественной муки и зернопродуктов.
      </Paragraph>

      <Row gutter={[24, 24]} style={{ marginTop: 32 }}>
        <Col xs={24} md={12}>
          <Card>
            <ShopOutlined style={{ fontSize: 32, color: '#D4A843' }} />
            <Title level={4}>Производство</Title>
            <Paragraph>
              Мощность завода — до 200 тонн муки и 70 тонн отрубей в сутки.
              Современное оборудование позволяет стабильно удерживать
              высокое качество продукции.
            </Paragraph>
          </Card>
        </Col>
        <Col xs={24} md={12}>
          <Card>
            <SafetyOutlined style={{ fontSize: 32, color: '#D4A843' }} />
            <Title level={4}>Сертификация</Title>
            <Paragraph>
              Вся продукция соответствует ГОСТ Р 26574-2017 и ГОСТ 7169-2017.
              Имеем все необходимые сертификаты качества и лицензии.
            </Paragraph>
          </Card>
        </Col>
        <Col xs={24} md={12}>
          <Card>
            <CarOutlined style={{ fontSize: 32, color: '#D4A843' }} />
            <Title level={4}>Логистика</Title>
            <Paragraph>
              Собственный парк техники: Камаз, Маз, Газ, муковозы.
              Возможна отгрузка как автотранспортом, так и речным транспортом
              через собственный причал.
            </Paragraph>
          </Card>
        </Col>
        <Col xs={24} md={12}>
          <Card>
            <ContainerOutlined style={{ fontSize: 32, color: '#D4A843' }} />
            <Title level={4}>Хранение</Title>
            <Paragraph>
              Складские мощности позволяют хранить до 50 000 тонн зерна
              единовременно. Современные элеваторы обеспечивают сохранность
              качества сырья.
            </Paragraph>
          </Card>
        </Col>
      </Row>
    </div>
  )
}
