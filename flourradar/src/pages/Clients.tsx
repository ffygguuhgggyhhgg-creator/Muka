import { useState } from 'react'
import { useStore } from '../store'
import { Search, Phone, Mail, MapPin, Building, ChevronDown, ChevronUp } from 'lucide-react'

const statusColors: Record<string, string> = {
  active: 'text-green-600 bg-green-50',
  inactive: 'text-stone-500 bg-stone-100',
  lead: 'text-blue-600 bg-blue-50',
}

const statusLabels: Record<string, string> = {
  active: 'Активный',
  inactive: 'Неактивный',
  lead: 'Потенциальный',
}

export function Clients() {
  const clients = useStore(s => s.clients)
  const [search, setSearch] = useState('')
  const [expandedId, setExpandedId] = useState<string | null>(null)

  const filtered = clients.filter(c =>
    !search || c.name.toLowerCase().includes(search.toLowerCase()) || c.company.toLowerCase().includes(search.toLowerCase())
  )

  return (
    <div className="p-4 space-y-4">
      <div className="flex items-center justify-between">
        <h2 className="text-lg font-bold">Клиенты</h2>
        <span className="text-[10px] text-stone-400 bg-stone-100 px-2 py-1 rounded-full">
          {clients.length} клиентов
        </span>
      </div>

      <div className="relative">
        <Search size={16} className="absolute left-3 top-1/2 -translate-y-1/2 text-stone-400" />
        <input type="text" placeholder="Поиск клиентов..." value={search} onChange={e => setSearch(e.target.value)}
          className="w-full pl-9 pr-4 py-2.5 bg-white border border-stone-200 rounded-xl text-sm focus:outline-none focus:ring-2 focus:ring-amber-500/20 focus:border-amber-500" />
      </div>

      <div className="space-y-3">
        {filtered.map(c => {
          const expanded = expandedId === c.id
          return (
            <div key={c.id} className="bg-white rounded-xl border border-stone-100 shadow-sm overflow-hidden">
              <div className="p-3.5">
                <div className="flex items-start gap-3">
                  <div className="w-10 h-10 rounded-full bg-amber-100 text-amber-700 flex items-center justify-center font-bold text-sm flex-shrink-0">
                    {c.name.charAt(0)}
                  </div>
                  <div className="flex-1 min-w-0">
                    <div className="flex items-center gap-2">
                      <h3 className="font-semibold text-sm">{c.name}</h3>
                      <span className={`px-1.5 py-0.5 rounded text-[10px] font-medium ${statusColors[c.status]}`}>
                        {statusLabels[c.status]}
                      </span>
                    </div>
                    <p className="text-xs text-stone-400 mt-0.5">{c.company}</p>
                    <div className="flex items-center gap-3 mt-2 text-[10px] text-stone-400">
                      <span className="flex items-center gap-1"><Building size={10} />{c.type}</span>
                      <span className="flex items-center gap-1"><MapPin size={10} />{c.geo}</span>
                    </div>
                  </div>
                </div>

                {expanded && (
                  <div className="mt-3 pt-3 border-t border-stone-100 space-y-3">
                    <div className="space-y-2 text-xs">
                      <div className="flex items-center gap-2 text-stone-600">
                        <Phone size={12} />
                        <a href={`tel:${c.phone}`} className="text-amber-700 font-medium">{c.phone}</a>
                      </div>
                      <div className="flex items-center gap-2 text-stone-600">
                        <Mail size={12} />
                        <a href={`mailto:${c.email}`} className="text-amber-700 font-medium">{c.email}</a>
                      </div>
                    </div>

                    <div className="grid grid-cols-2 gap-2 text-xs">
                      <div className="bg-stone-50 rounded-lg p-2">
                        <span className="text-stone-400">Всего отгружено</span>
                        <p className="font-bold text-amber-900">{c.totalVolume} т</p>
                      </div>
                      <div className="bg-stone-50 rounded-lg p-2">
                        <span className="text-stone-400">Выручка</span>
                        <p className="font-bold text-amber-900">{c.revenue.toLocaleString()} ₽</p>
                      </div>
                    </div>

                    <div className="text-[10px] text-stone-400">
                      Последний контакт: {c.lastContact}
                    </div>

                    <button className="w-full bg-amber-900 text-white text-xs py-2 rounded-lg font-medium">
                      Связаться
                    </button>
                  </div>
                )}
              </div>

              <button onClick={() => setExpandedId(expanded ? null : c.id)}
                className="w-full py-1.5 flex items-center justify-center gap-1 text-[10px] text-stone-400 bg-stone-50 border-t border-stone-100">
                {expanded ? 'Свернуть' : 'Подробнее'}
                {expanded ? <ChevronUp size={12} /> : <ChevronDown size={12} />}
              </button>
            </div>
          )
        })}
      </div>
    </div>
  )
}
