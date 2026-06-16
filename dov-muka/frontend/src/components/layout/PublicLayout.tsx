import { Outlet } from 'react-router-dom'
import { Layout } from 'antd'
import PublicHeader from './PublicHeader'
import PublicFooter from './PublicFooter'

const { Content } = Layout

export default function PublicLayout() {
  return (
    <Layout style={{ minHeight: '100vh' }}>
      <PublicHeader />
      <Content>
        <Outlet />
      </Content>
      <PublicFooter />
    </Layout>
  )
}
