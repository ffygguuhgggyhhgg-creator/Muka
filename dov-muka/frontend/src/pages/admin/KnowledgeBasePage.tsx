import { useEffect, useState } from 'react'
import { Card, Typography, Tag, Input, Spin, Collapse } from 'antd'
import ReactMarkdown from 'react-markdown'
import { BookOutlined, SearchOutlined } from '@ant-design/icons'
import api from '../../services/api'

const { Title } = Typography

interface Article {
  id: number
  title: string
  slug: string
  category: string
  tags: string[]
  excerpt: string
  view_count: number
}

interface ArticleContent {
  id: number
  title: string
  slug: string
  content: string
  view_count: number
}

const categoryLabels: Record<string, string> = {
  products: 'Продукция',
  production: 'Производство',
  sales: 'Продажи',
  logistics: 'Логистика',
  documents: 'Документы',
  training: 'Обучение',
  regulations: 'Регламенты',
}

export default function KnowledgeBasePage() {
  const [articles, setArticles] = useState<Article[]>([])
  const [loading, setLoading] = useState(true)
  const [search, setSearch] = useState('')
  const [category, setCategory] = useState<string>()
  const [contentMap, setContentMap] = useState<Record<string, ArticleContent>>({})

  useEffect(() => {
    setLoading(true)
    api.get('/knowledge-base', { params: { search, category } })
      .then(({ data }) => setArticles(data.items))
      .finally(() => setLoading(false))
  }, [search, category])

  const fetchContent = async (slug: string) => {
    if (contentMap[slug]) return
    const { data } = await api.get(`/knowledge-base/${slug}`)
    setContentMap(prev => ({ ...prev, [slug]: data }))
  }

  const grouped = articles.reduce<Record<string, Article[]>>((acc, article) => {
    const cat = article.category || 'other'
    if (!acc[cat]) acc[cat] = []
    acc[cat].push(article)
    return acc
  }, {})

  return (
    <div>
      <div style={{ display: 'flex', justifyContent: 'space-between', marginBottom: 16 }}>
        <Title level={3}><BookOutlined /> База знаний</Title>
        <Input.Search
          placeholder="Поиск по статьям..."
          prefix={<SearchOutlined />}
          value={search}
          onChange={(e) => setSearch(e.target.value)}
          allowClear
          style={{ width: 300 }}
        />
      </div>

      <div style={{ marginBottom: 16 }}>
        <Tag
          style={{ cursor: 'pointer', marginBottom: 4 }}
          color={!category ? 'gold' : 'default'}
          onClick={() => setCategory(undefined)}
        >
          Все
        </Tag>
        {Object.entries(categoryLabels).map(([key, label]) => (
          <Tag
            key={key}
            style={{ cursor: 'pointer', marginBottom: 4 }}
            color={category === key ? 'gold' : 'default'}
            onClick={() => setCategory(key)}
          >
            {label}
          </Tag>
        ))}
      </div>

      <Spin spinning={loading}>
        {Object.entries(grouped).map(([cat, items]) => (
          <Card
            key={cat}
            title={categoryLabels[cat] || cat}
            style={{ marginBottom: 16 }}
          >
            <Collapse
              items={items.map((article) => ({
                key: article.slug,
                label: (
                  <div style={{ display: 'flex', justifyContent: 'space-between' }}>
                    <span>{article.title}</span>
                    <span style={{ color: '#999', fontSize: 12 }}>
                      {article.view_count} просмотров
                    </span>
                  </div>
                ),
                children: contentMap[article.slug] ? (
                  <div style={{ padding: 16, background: '#fafafa', borderRadius: 6 }}>
                    <ReactMarkdown>{contentMap[article.slug].content}</ReactMarkdown>
                  </div>
                ) : (
                  <Paragraph onClick={() => fetchContent(article.slug)}>
                    {article.excerpt || 'Нет содержания'}
                  </Paragraph>
                ),
              }))}
              onChange={(keys) => {
                if (keys.length > 0) {
                  fetchContent(keys[keys.length - 1])
                }
              }}
            />
          </Card>
        ))}
      </Spin>
    </div>
  )
}

function Paragraph({ children, onClick }: { children: React.ReactNode; onClick?: () => void }) {
  return (
    <div onClick={onClick} style={{ cursor: onClick ? 'pointer' : undefined }}>
      {children}
    </div>
  )
}
