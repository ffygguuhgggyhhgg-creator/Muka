import { useStore } from '../store'
import { Package, TrendingUp, Users, AlertCircle, ArrowUp } from 'lucide-react'

export function Dashboard() {
  const analytics = useStore(s => s.analytics)
  const leads = useStore(s => s.leads)

  const stats = [
    { label: 'Всего лидов', value: analytics.totalLeads, icon: AlertCircle, color: 'bg-blue-500', trend: '+12%' },
    { label: 'Квалиф. лиды', value: analytics.qualifiedLeads, icon: TrendingUp, color: 'bg-green-500', trend: '+8%' },
    { label: 'Продажи, т', value: analytics.monthlyVolume, icon: Package, color: 'bg-amber-600', trend: '+6%', suffix: 'т' },
    { label: 'Клиенты', value: analytics.activeClients, icon: Users, color: 'bg-purple-500', trend: '+3' },
  ]

  const recentLeads = leads.filter(l => l.status === 'new' || l.status === 'in_progress').slice(0, 4)

  return (
    <div className="p-4 space-y-4">
      <div className="flex items-center justify-between">
        <h2 className="text-lg font-bold">Панель управления</h2>
        <span className="text-xs text-stone-400">Июнь 2026</span>
      </div>

      <div className="grid grid-cols-2 gap-3">
        {stats.map(s => (
          <div key={s.label} className="bg-white rounded-xl p-3.5 shadow-sm border border-stone-100">
            <div className="flex items-center justify-between mb-2">
              <div className={`w-8 h-8 rounded-lg ${s.color} flex items-center justify-center`}>
                <s.icon size={16} className="text-white" />
              </div>
              <span className="text-[10px] font-medium text-green-600 flex items-center gap-0.5">
                <ArrowUp size={10} />
                {s.trend}
              </span>
            </div>
            <div className="text-lg font-bold">{s.value}{s.suffix || ''}</div>
            <div className="text-[10px] text-stone-400">{s.label}</div>
          </div>
        ))}
      </div>

      <div className="bg-white rounded-xl shadow-sm border border-stone-100 p-4">
        <div className="flex items-center justify-between mb-3">
          <h3 className="font-semibold text-sm">Выполнение плана</h3>
          <span className="text-xs font-medium text-amber-700 bg-amber-50 px-2 py-0.5 rounded-full">
            {analytics.planFulfillment}%
          </span>
        </div>
        <div className="w-full bg-stone-100 rounded-full h-3">
          <div
            className="bg-amber-600 h-3 rounded-full transition-all"
            style={{ width: `${analytics.planFulfillment}%` }}
          />
        </div>
        <div className="flex justify-between mt-1.5 text-[10px] text-stone-400">
          <span>{analytics.monthlyVolume.toLocaleString()} т / {6000} т</span>
          <span>{analytics.monthlyRevenue.toLocaleString()} ₽</span>
        </div>
      </div>

      <div className="bg-white rounded-xl shadow-sm border border-stone-100 p-4">
        <h3 className="font-semibold text-sm mb-3">Свежие лиды</h3>
        <div className="space-y-2">
          {recentLeads.map(lead => (
            <div key={lead.id} className="flex items-start gap-2.5 p-2.5 rounded-lg bg-stone-50">
              <div className={`w-2 h-2 rounded-full mt-1.5 flex-shrink-0 ${
                lead.urgency === 'high' ? 'bg-red-500' :
                lead.urgency === 'medium' ? 'bg-amber-400' : 'bg-blue-400'
              }`} />
              <div className="flex-1 min-w-0">
                <p className="text-xs text-stone-700 line-clamp-2">{lead.message}</p>
                <div className="flex items-center gap-2 mt-1 text-[10px] text-stone-400">
                  <span>{lead.sourceLabel}</span>
                  <span>•</span>
                  <span className="font-medium text-amber-700">{lead.relevance}%</span>
                </div>
              </div>
            </div>
          ))}
        </div>
      </div>

      <div className="bg-amber-900 text-white rounded-xl p-4">
        <h3 className="font-semibold text-sm mb-1">Текущая ситуация</h3>
        <p className="text-xs text-amber-200/80 mb-2">Технологическая пауза до ~1 июля</p>
        <div className="flex gap-2 text-[10px]">
          <span className="bg-amber-800 px-2 py-1 rounded-full">Отгрузки с 1 июля</span>
          <span className="bg-amber-800 px-2 py-1 rounded-full">Резерв 3 000 т</span>
        </div>
      </div>
    </div>
  )
}
