import { Layout, Typography, Space } from 'antd'

const { Footer } = Layout
const { Text, Link } = Typography

export default function PublicFooter() {
  return (
    <Footer style={{
      background: '#1a1a2e',
      color: '#fff',
      padding: '40px 40px 24px',
    }}>
      <div style={{
        maxWidth: 1200,
        margin: '0 auto',
        display: 'flex',
        justifyContent: 'space-between',
        flexWrap: 'wrap',
        gap: 24,
      }}>
        <div>
          <Text strong style={{ color: '#D4A843', fontSize: 18 }}>ТД Шихобалова</Text>
          <br />
          <Text style={{ color: '#ccc' }}>Крупнейший мукомольный завод</Text>
          <br />
          <Text style={{ color: '#ccc' }}>Самарской области</Text>
        </div>
        <div>
          <Text strong style={{ color: '#fff' }}>Контакты</Text>
          <br />
          <Text style={{ color: '#ccc' }}>+7 (846) 123-45-67</Text>
          <br />
          <Text style={{ color: '#ccc' }}>info@dov-muka.ru</Text>
          <br />
          <Text style={{ color: '#ccc' }}>г. Самара, ул. Заводская, 1</Text>
        </div>
        <div>
          <Text strong style={{ color: '#fff' }}>Продукция</Text>
          <br />
          <Link href="/catalog" style={{ color: '#ccc' }}>Мука в/с</Link>
          <br />
          <Link href="/catalog" style={{ color: '#ccc' }}>Мука 1 сорт</Link>
          <br />
          <Link href="/catalog" style={{ color: '#ccc' }}>Отруби</Link>
        </div>
      </div>
      <div style={{ textAlign: 'center', marginTop: 32, borderTop: '1px solid #333', paddingTop: 16 }}>
        <Text style={{ color: '#666' }}>
          © {new Date().getFullYear()} ООО "ТД Шихобалова". Все права защищены.
        </Text>
      </div>
    </Footer>
  )
}
