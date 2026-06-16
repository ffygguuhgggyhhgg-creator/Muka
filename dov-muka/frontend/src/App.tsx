import { Routes, Route } from 'react-router-dom'
import PublicLayout from './components/layout/PublicLayout'
import AdminLayout from './components/layout/AdminLayout'
import HomePage from './pages/public/HomePage'
import CatalogPage from './pages/public/CatalogPage'
import ProductPage from './pages/public/ProductPage'
import ContactsPage from './pages/public/ContactsPage'
import AboutPage from './pages/public/AboutPage'
import LoginPage from './pages/public/LoginPage'
import DashboardPage from './pages/admin/DashboardPage'
import ClientsPage from './pages/admin/ClientsPage'
import DealsPage from './pages/admin/DealsPage'
import OrdersPage from './pages/admin/OrdersPage'
import KnowledgeBasePage from './pages/admin/KnowledgeBasePage'
import ProductsPage from './pages/admin/ProductsPage'

function App() {
  return (
    <Routes>
      <Route element={<PublicLayout />}>
        <Route path="/" element={<HomePage />} />
        <Route path="/catalog" element={<CatalogPage />} />
        <Route path="/catalog/:slug" element={<ProductPage />} />
        <Route path="/contacts" element={<ContactsPage />} />
        <Route path="/about" element={<AboutPage />} />
        <Route path="/login" element={<LoginPage />} />
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
  )
}

export default App
