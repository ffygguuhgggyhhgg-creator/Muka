import { Suspense, lazy } from 'react'
import { Routes, Route } from 'react-router-dom'
import PublicLayout from './components/layout/PublicLayout'
import HomePage from './pages/public/HomePage'

/*
 * Главная загружается сразу, всё остальное по требованию.
 * Ant Design попадает только в отложенные части, поэтому первый экран
 * не ждёт библиотеку компонентов и админку.
 */
const AntdShell = lazy(() => import('./components/layout/AntdShell'))
const AdminLayout = lazy(() => import('./components/layout/AdminLayout'))

const CatalogPage = lazy(() => import('./pages/public/CatalogPage'))
const ProductPage = lazy(() => import('./pages/public/ProductPage'))
const ContactsPage = lazy(() => import('./pages/public/ContactsPage'))
const AboutPage = lazy(() => import('./pages/public/AboutPage'))
const LoginPage = lazy(() => import('./pages/public/LoginPage'))

const DashboardPage = lazy(() => import('./pages/admin/DashboardPage'))
const ClientsPage = lazy(() => import('./pages/admin/ClientsPage'))
const DealsPage = lazy(() => import('./pages/admin/DealsPage'))
const OrdersPage = lazy(() => import('./pages/admin/OrdersPage'))
const KnowledgeBasePage = lazy(() => import('./pages/admin/KnowledgeBasePage'))
const ProductsPage = lazy(() => import('./pages/admin/ProductsPage'))

function Loading() {
  return <div className="pub-loading">Загружаем раздел</div>
}

function App() {
  return (
    <Suspense fallback={<Loading />}>
      <Routes>
        <Route element={<PublicLayout />}>
          <Route path="/" element={<HomePage />} />
          <Route element={<AntdShell />}>
            <Route path="/catalog" element={<CatalogPage />} />
            <Route path="/catalog/:slug" element={<ProductPage />} />
            <Route path="/contacts" element={<ContactsPage />} />
            <Route path="/about" element={<AboutPage />} />
            <Route path="/login" element={<LoginPage />} />
          </Route>
        </Route>
        <Route path="/admin" element={<AdminLayout />}>
          <Route index element={<DashboardPage />} />
          <Route path="clients" element={<ClientsPage />} />
          <Route path="deals" element={<DealsPage />} />
          <Route path="orders" element={<OrdersPage />} />
          <Route path="knowledge-base" element={<KnowledgeBasePage />} />
          <Route path="products" element={<ProductsPage />} />
        </Route>
      </Routes>
    </Suspense>
  )
}

export default App
