import { useEffect, useState } from 'react'
import { Link } from 'react-router-dom'
import { Card, Row, Col, Typography, Tag, Spin, Input, Select } from 'antd'
import api from '../../services/api'

const { Title, Paragraph } = Typography

interface Product {
  id: number
  name: string
  slug: string
  category: string
  sort: string
  description: string
  gost: string
  price: number | null
  price_on_request: boolean
  unit: string
}

export default function CatalogPage() {
  const [products, setProducts] = useState<Product[]>([])
  const [loading, setLoading] = useState(true)
  const [search, setSearch] = useState('')
  const [category, setCategory] = useState<string>()

  useEffect(() => {
    setLoading(true)
    api.get('/products', { params: { search, category, page_size: 50 } })
      .then(({ data }) => setProducts(data.items))
      .finally(() => setLoading(false))
  }, [search, category])

  return (
    <div style={{ padding: '40px', maxWidth: 1200, margin: '0 auto' }}>
      <Title>Каталог продукции</Title>
      <Paragraph style={{ color: '#666', fontSize: 16 }}>
        Вся продукция сертифицирована и соответствует ГОСТ
      </Paragraph>

      <div style={{ display: 'flex', gap: 16, marginBottom: 32 }}>
        <Input.Search
          placeholder="Поиск продукции..."
          value={search}
          onChange={(e) => setSearch(e.target.value)}
          style={{ maxWidth: 400 }}
          allowClear
        />
        <Select
          placeholder="Категория"
          value={category}
          onChange={setCategory}
          allowClear
          style={{ width: 200 }}
          options={[
            { value: 'flour', label: 'Мука' },
            { value: 'bran', label: 'Отруби' },
            { value: 'grain', label: 'Зернопродукты' },
          ]}
        />
      </div>

      <Spin spinning={loading}>
        <Row gutter={[24, 24]}>
          {products.map((product) => (
            <Col xs={24} sm={12} md={8} key={product.id}>
              <Link to={`/catalog/${product.slug}`}>
                <Card
                  hoverable
                  style={{ borderRadius: 8, height: '100%' }}
                >
                  <Tag color="gold">{product.category === 'flour' ? 'Мука' : product.category === 'bran' ? 'Отруби' : 'Зернопродукты'}</Tag>
                  <Title level={4} style={{ marginTop: 12 }}>{product.name}</Title>
                  {product.sort && <Tag>{product.sort}</Tag>}
                  {product.gost && <div style={{ color: '#999', fontSize: 12, marginTop: 8 }}>{product.gost}</div>}
                  <Paragraph style={{ marginTop: 12, color: '#666' }} ellipsis={{ rows: 2 }}>
                    {product.description}
                  </Paragraph>
                  <div style={{ color: '#D4A843', fontWeight: 700, fontSize: 18 }}>
                    {product.price_on_request ? 'Цена по запросу' : `от ${product.price} ₽/${product.unit}`}
                  </div>
                </Card>
              </Link>
            </Col>
          ))}
        </Row>
      </Spin>
    </div>
  )
}
