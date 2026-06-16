import { useEffect, useState } from 'react'
import { useParams, Link } from 'react-router-dom'
import { Typography, Card, Descriptions, Tag, Button, Spin, Space } from 'antd'
import { ShoppingCartOutlined, ArrowLeftOutlined } from '@ant-design/icons'
import api from '../../services/api'

const { Title, Paragraph } = Typography

interface Product {
  id: number
  name: string
  category: string
  sort: string | null
  description: string
  full_description: string | null
  gost: string | null
  specifications: Record<string, string> | null
  packaging: Record<string, string> | null
  min_order: number | null
  unit: string
  price: number | null
  price_on_request: boolean
  application: string | null
}

export default function ProductPage() {
  const { slug } = useParams()
  const [product, setProduct] = useState<Product | null>(null)
  const [loading, setLoading] = useState(true)

  useEffect(() => {
    if (slug) {
      setLoading(true)
      api.get(`/products/${slug}`)
        .then(({ data }) => setProduct(data))
        .finally(() => setLoading(false))
    }
  }, [slug])

  if (loading) return <div style={{ textAlign: 'center', padding: 80 }}><Spin size="large" /></div>
  if (!product) return <div style={{ padding: 40 }}>Товар не найден</div>

  return (
    <div style={{ padding: '40px', maxWidth: 1000, margin: '0 auto' }}>
      <Link to="/catalog" style={{ display: 'block', marginBottom: 16 }}>
        <ArrowLeftOutlined /> Назад к каталогу
      </Link>

      <Card>
        <Space direction="vertical" size="middle" style={{ width: '100%' }}>
          <div>
            <Tag color="gold">
              {product.category === 'flour' ? 'Мука' : product.category === 'bran' ? 'Отруби' : 'Зернопродукты'}
            </Tag>
            {product.sort && <Tag>{product.sort}</Tag>}
          </div>

          <Title>{product.name}</Title>

          {product.gost && (
            <Tag color="blue" style={{ fontSize: 14, padding: '4px 12px' }}>{product.gost}</Tag>
          )}

          <Paragraph style={{ fontSize: 16 }}>{product.description}</Paragraph>

          {product.specifications && (
            <Descriptions title="Технические характеристики" bordered column={1}>
              {Object.entries(product.specifications).map(([key, value]) => (
                <Descriptions.Item label={key} key={key}>{value}</Descriptions.Item>
              ))}
            </Descriptions>
          )}

          {product.packaging && (
            <Descriptions title="Фасовка" bordered column={1}>
              {Object.entries(product.packaging).map(([key, value]) => (
                <Descriptions.Item label={key} key={key}>{value}</Descriptions.Item>
              ))}
            </Descriptions>
          )}

          {product.application && (
            <>
              <Title level={4}>Применение</Title>
              <Paragraph>{product.application}</Paragraph>
            </>
          )}

          {product.min_order && (
            <div>Минимальный заказ: <strong>{product.min_order} {product.unit}</strong></div>
          )}

          <div style={{
            background: '#fafafa',
            padding: 24,
            borderRadius: 8,
            display: 'flex',
            justifyContent: 'space-between',
            alignItems: 'center',
          }}>
            <div style={{ fontSize: 24, fontWeight: 700, color: '#D4A843' }}>
              {product.price_on_request ? 'Цена по запросу' : `${product.price} ₽/${product.unit}`}
            </div>
            <Button type="primary" size="large" icon={<ShoppingCartOutlined />}>
              Оформить заказ
            </Button>
          </div>
        </Space>
      </Card>
    </div>
  )
}
