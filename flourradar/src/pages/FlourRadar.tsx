import { useState } from 'react'
import { useStore } from '../store'
import { Search, MessageCircle, Globe, FileText, Clock, MapPin, Zap, CheckCircle, XCircle, ChevronDown, ChevronUp } from 'lucide-react'

const sourceIcons: Record<string, typeof MessageCircle> = {
  telegram: MessageCircle,
  vkontakte: Globe,
  forum: FileText,
  whatsapp: MessageCircle,
}

const sourceColors: Record<string, string> = {
  telegram: 'bg-sky-100 text-sky-600',
  vkontakte: 'bg-blue-100 text-blue-600',
  forum: 'bg-stone-100 text-stone-600',
  whatsapp: 'bg-green-100 text-green-600',
}

const urgencyColors: Record<string, string> = {
  high: 'bg-red-100 text-red-700 border-red-200',
  medium: 'bg-amber-100 text-amber-700 border-amber-200',
  low: 'bg-blue-100 text-blue-700 border-blue-200',
}

const statusLabels: Record<string, string> = {
  new: 'Новый', in_progress: 'В работе', qualified: 'Квалифицирован', converted: 'Конвертирован', junk: 'Мусор',
}

export function FlourRadar() {
  const leads = useStore(s => s.leads)
  const updateStatus = useStore(s => s.updateLeadStatus)
  const [search, setSearch] = useState('')
  const [filter, setFilter] = useState<string>('all')
  const [expandedId, setExpandedId] = useState<string | null>(null)

  const filtered = leads.filter(l => {
    if (filter !== 'all' && l.status !== filter) return false
    if (search && !l.message.toLowerCase().includes(search.toLowerCase()) && !l.contactName.toLowerCase().includes(search.toLowerCase())) return false
    return true
  })

  const getTimeAgo = (ts: string) => {
    const diff = Date.now() - new Date(ts).getTime()
    const min = Math.floor(diff / 60000)
    if (min < 60) return `${min} мин назад`
    const h = Math.floor(min / 60)
    if (h < 24) return `${h} ч назад`
    return `${Math.floor(h / 24)} д назад`
  }

  return (
    <div className="p-4 space-y-4">
      <div className="flex items-center justify-between">
        <h2 className="text-lg font-bold">FlourRadar</h2>
        <span className="text-[10px] text-stone-400 bg-stone-100 px-2 py-1 rounded-full">
          {leads.length} лидов
        </span>
      </div>

      <div className="relative">
        <Search size={16} className="absolute left-3 top-1/2 -translate-y-1/2 text-stone-400" />
        <input
          type="text" placeholder="Поиск по сообщениям..."
          value={search} onChange={e => setSearch(e.target.value)}
          className="w-full pl-9 pr-4 py-2.5 bg-white border border-stone-200 rounded-xl text-sm focus:outline-none focus:ring-2 focus:ring-amber-500/20 focus:border-amber-500"
        />
      </div>

      <div className="flex gap-2 overflow-x-auto pb-1">
        {(['all', 'new', 'in_progress', 'qualified', 'converted', 'junk'] as const).map(f => (
          <button key={f} onClick={() => setFilter(f)}
            className={`px-3 py-1.5 rounded-full text-xs font-medium whitespace-nowrap transition-colors ${
              filter === f ? 'bg-amber-900 text-white' : 'bg-white text-stone-500 border border-stone-200'
            }`}
          >
            {f === 'all' ? 'Все' : statusLabels[f]}
          </button>
        ))}
      </div>

      <div className="space-y-3">
        {filtered.map(lead => {
          const Icon = sourceIcons[lead.source] || MessageCircle
          const expanded = expandedId === lead.id
          return (
            <div key={lead.id} className="bg-white rounded-xl border border-stone-100 shadow-sm overflow-hidden">
              <div className="p-3.5">
                <div className="flex items-start gap-3">
                  <div className={`w-8 h-8 rounded-lg ${sourceColors[lead.source] || 'bg-stone-100'} flex items-center justify-center flex-shrink-0`}>
                    <Icon size={16} />
                  </div>
                  <div className="flex-1 min-w-0">
                    <div className="flex items-center gap-2 mb-1">
                      <span className="text-xs font-medium">{lead.sourceLabel}</span>
                      <span className={`px-1.5 py-0.5 rounded text-[10px] font-medium border ${urgencyColors[lead.urgency]}`}>
                        {lead.urgency === 'high' ? 'Срочно' : lead.urgency === 'medium' ? 'Средне' : 'Низкий'}
                      </span>
                      <span className="ml-auto text-[10px] text-stone-400 flex items-center gap-1">
                        <Clock size={10} />
                        {getTimeAgo(lead.timestamp)}
                      </span>
                    </div>
                    <p className="text-sm leading-relaxed">{lead.message}</p>
                    <div className="flex items-center gap-3 mt-2 text-[10px] text-stone-400">
                      <span className="flex items-center gap-1"><MapPin size={10} />{lead.geo}</span>
                      <span className="flex items-center gap-1"><Zap size={10} />{lead.relevance}%</span>
                      {lead.volume && <span>Объём: {lead.volume}</span>}
                    </div>
                  </div>
                </div>

                {expanded && (
                  <div className="mt-3 pt-3 border-t border-stone-100 space-y-2.5">
                    <div className="grid grid-cols-2 gap-2 text-xs">
                      <div className="bg-stone-50 rounded-lg p-2">
                        <span className="text-stone-400">Клиент</span>
                        <p className="font-medium">{lead.contactName}</p>
                      </div>
                      <div className="bg-stone-50 rounded-lg p-2">
                        <span className="text-stone-400">Контакты</span>
                        <p className="font-medium">{lead.contactUsername}</p>
                      </div>
                      <div className="bg-stone-50 rounded-lg p-2">
                        <span className="text-stone-400">Категория</span>
                        <p className="font-medium">{lead.category}</p>
                      </div>
                      <div className="bg-stone-50 rounded-lg p-2">
                        <span className="text-stone-400">Статус</span>
                        <p className="font-medium">{statusLabels[lead.status]}</p>
                      </div>
                    </div>

                    <div className="flex gap-2">
                      {lead.status === 'new' && (
                        <>
                          <button onClick={() => updateStatus(lead.id, 'in_progress')}
                            className="flex-1 bg-amber-900 text-white text-xs py-2 rounded-lg font-medium flex items-center justify-center gap-1">
                            <CheckCircle size={14} /> Взять в работу
                          </button>
                          <button onClick={() => updateStatus(lead.id, 'junk')}
                            className="flex-1 bg-stone-100 text-stone-500 text-xs py-2 rounded-lg font-medium flex items-center justify-center gap-1">
                            <XCircle size={14} /> Пропустить
                          </button>
                        </>
                      )}
                      {lead.status === 'in_progress' && (
                        <>
                          <button onClick={() => updateStatus(lead.id, 'qualified')}
                            className="flex-1 bg-green-600 text-white text-xs py-2 rounded-lg font-medium">
                            Квалифицирован
                          </button>
                          <button onClick={() => updateStatus(lead.id, 'junk')}
                            className="flex-1 bg-stone-100 text-stone-500 text-xs py-2 rounded-lg font-medium">
                            Не подходит
                          </button>
                        </>
                      )}
                      {lead.status === 'qualified' && (
                        <button onClick={() => updateStatus(lead.id, 'converted')}
                          className="flex-1 bg-green-600 text-white text-xs py-2 rounded-lg font-medium">
                          Конвертирован в клиента
                        </button>
                      )}
                    </div>
                  </div>
                )}
              </div>

              <button onClick={() => setExpandedId(expanded ? null : lead.id)}
                className="w-full py-1.5 flex items-center justify-center gap-1 text-[10px] text-stone-400 bg-stone-50 border-t border-stone-100">
                {expanded ? 'Свернуть' : 'Подробнее'}
                {expanded ? <ChevronUp size={12} /> : <ChevronDown size={12} />}
              </button>
            </div>
          )
        })}
        {filtered.length === 0 && (
          <div className="text-center py-12 text-stone-400">
            <Search size={32} className="mx-auto mb-2 opacity-50" />
            <p className="text-sm">Лидов не найдено</p>
          </div>
        )}
      </div>
    </div>
  )
}
