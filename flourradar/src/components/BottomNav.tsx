import { NavLink } from 'react-router-dom'
import { Home, Radar, Package, BarChart3, Users, Settings } from 'lucide-react'
import { useStore } from '../store'

const tabs = [
  { to: '/', label: 'Главная', icon: Home },
  { to: '/radar', label: 'Радар', icon: Radar, badge: true },
  { to: '/catalog', label: 'Каталог', icon: Package },
  { to: '/analytics', label: 'Аналитика', icon: BarChart3 },
  { to: '/clients', label: 'Клиенты', icon: Users },
  { to: '/settings', label: 'Настройки', icon: Settings },
]

export function BottomNav() {
  const unread = useStore(s => s.unreadLeads)

  return (
    <nav className="fixed bottom-0 left-0 right-0 z-20 bg-white border-t border-stone-200 shadow-[0_-2px_8px_rgba(0,0,0,0.05)]">
      <div className="max-w-lg mx-auto flex">
        {tabs.map(tab => (
          <NavLink
            key={tab.to}
            to={tab.to}
            end={tab.to === '/'}
            className={({ isActive }) =>
              `flex-1 flex flex-col items-center py-1.5 text-[10px] font-medium transition-colors relative ${
                isActive ? 'text-amber-700' : 'text-stone-400'
              }`
            }
          >
            <div className="relative">
              <tab.icon size={20} strokeWidth={1.5} />
              {tab.badge && unread > 0 && (
                <span className="absolute -top-1 -right-1.5 w-4 h-4 rounded-full bg-red-500 text-white text-[8px] flex items-center justify-center font-bold">
                  {unread > 9 ? '9+' : unread}
                </span>
              )}
            </div>
            <span className="mt-0.5">{tab.label}</span>
          </NavLink>
        ))}
      </div>
    </nav>
  )
}
