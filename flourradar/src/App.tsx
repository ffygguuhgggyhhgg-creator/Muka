import { Routes, Route, Navigate } from 'react-router-dom'
import { useEffect } from 'react'
import { BottomNav } from './components/BottomNav'
import { Dashboard } from './pages/Dashboard'
import { FlourRadar } from './pages/FlourRadar'
import { Catalog } from './pages/Catalog'
import { Analytics } from './pages/Analytics'
import { Clients } from './pages/Clients'
import { Settings } from './pages/Settings'
import { useStore } from './store'

export default function App() {
  const leads = useStore(s => s.leads)
  const setUnread = useStore(s => s.setUnreadLeads)

  useEffect(() => {
    setUnread(leads.filter(l => l.status === 'new').length)
  }, [leads, setUnread])

  return (
    <div className="flex flex-col min-h-dvh max-w-lg mx-auto bg-stone-50">
      <header className="sticky top-0 z-20 bg-amber-900 text-white px-4 py-3 flex items-center gap-3 shadow-lg">
        <div className="w-8 h-8 rounded-lg bg-amber-600 flex items-center justify-center font-bold text-sm">F</div>
        <div className="flex-1">
          <h1 className="text-base font-bold leading-tight">FlourRadar</h1>
          <p className="text-[10px] text-amber-200/80">ТД Шихобалова • Система поиска клиентов</p>
        </div>
        <div className="flex items-center gap-2 text-xs text-amber-200">
          <span className="flex items-center gap-1">
            <span className="w-1.5 h-1.5 rounded-full bg-green-400 inline-block" />
            Online
          </span>
        </div>
      </header>

      <main className="flex-1 overflow-y-auto pb-20">
        <Routes>
          <Route path="/" element={<Dashboard />} />
          <Route path="/radar" element={<FlourRadar />} />
          <Route path="/catalog" element={<Catalog />} />
          <Route path="/analytics" element={<Analytics />} />
          <Route path="/clients" element={<Clients />} />
          <Route path="/settings" element={<Settings />} />
          <Route path="*" element={<Navigate to="/" replace />} />
        </Routes>
      </main>

      <BottomNav />
    </div>
  )
}
