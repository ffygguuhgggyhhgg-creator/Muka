import { Outlet } from 'react-router-dom'
import PublicHeader from './PublicHeader'
import PublicFooter from './PublicFooter'

export default function PublicLayout() {
  return (
    <div className="pub">
      <PublicHeader />
      <main className="pub-main">
        <Outlet />
      </main>
      <PublicFooter />
    </div>
  )
}
