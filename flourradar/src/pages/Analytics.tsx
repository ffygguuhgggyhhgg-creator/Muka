import { useStore } from '../store'
import { BarChart, Bar, XAxis, YAxis, CartesianGrid, Tooltip, ResponsiveContainer, LineChart, Line, PieChart, Pie, Cell } from 'recharts'
import { TrendingUp } from 'lucide-react'

const COLORS = ['#92400e', '#d97706', '#f59e0b', '#fbbf24', '#fde68a']
const SOURCE_COLORS = ['#0ea5e9', '#3b82f6', '#78716c', '#22c55e', '#a8a29e']

function CustomTooltip({ active, payload, label }: any) {
  if (active && payload?.length) {
    return (
      <div className="bg-white border border-stone-200 shadow-lg rounded-lg px-3 py-2 text-xs">
        <p className="font-medium text-stone-700">{label}</p>
        {payload.map((p: any, i: number) => (
          <p key={i} style={{ color: p.color }}>{p.name}: {p.value.toLocaleString()}</p>
        ))}
      </div>
    )
  }
  return null
}

export function Analytics() {
  const analytics = useStore(s => s.analytics)

  const totalLeadsBySource = analytics.leadsBySource.reduce((s, l) => s + l.count, 0)
  const totalLeadsByCategory = analytics.leadsByCategory.reduce((s, l) => s + l.count, 0)

  return (
    <div className="p-4 space-y-4">
      <div className="flex items-center justify-between">
        <h2 className="text-lg font-bold">Аналитика</h2>
        <span className="text-[10px] text-stone-400 bg-stone-100 px-2 py-1 rounded-full">
          2026 • 6 мес
        </span>
      </div>

      <div className="grid grid-cols-2 gap-3">
        <div className="bg-white rounded-xl p-3.5 shadow-sm border border-stone-100">
          <div className="text-[10px] text-stone-400 mb-1">Конверсия лидов</div>
          <div className="text-xl font-bold text-green-600">{analytics.conversionRate}%</div>
          <div className="flex items-center gap-1 text-[10px] text-green-600 mt-0.5">
            <TrendingUp size={12} /> +5% к прошлому месяцу
          </div>
        </div>
        <div className="bg-white rounded-xl p-3.5 shadow-sm border border-stone-100">
          <div className="text-[10px] text-stone-400 mb-1">Средний чек</div>
          <div className="text-xl font-bold text-amber-900">
            {new Intl.NumberFormat('ru-RU').format(Math.round(analytics.monthlyRevenue / analytics.activeClients))} ₽
          </div>
          <div className="flex items-center gap-1 text-[10px] text-stone-400 mt-0.5">на 1 клиента</div>
        </div>
      </div>

      <div className="bg-white rounded-xl shadow-sm border border-stone-100 p-4">
        <h3 className="font-semibold text-sm mb-3">Динамика продаж</h3>
        <ResponsiveContainer width="100%" height={200}>
          <BarChart data={analytics.salesData}>
            <CartesianGrid strokeDasharray="3 3" stroke="#e7e5e4" />
            <XAxis dataKey="month" tick={{ fontSize: 10 }} tickLine={false} />
            <YAxis tick={{ fontSize: 10 }} tickLine={false} axisLine={false} />
            <Tooltip content={<CustomTooltip />} />
            <Bar dataKey="volume" name="Объём, т" fill="#92400e" radius={[4, 4, 0, 0]} />
            <Bar dataKey="plan" name="План, т" fill="#d6d3d1" radius={[4, 4, 0, 0]} />
          </BarChart>
        </ResponsiveContainer>
      </div>

      <div className="bg-white rounded-xl shadow-sm border border-stone-100 p-4">
        <h3 className="font-semibold text-sm mb-3">Выручка по месяцам</h3>
        <ResponsiveContainer width="100%" height={200}>
          <LineChart data={analytics.salesData}>
            <CartesianGrid strokeDasharray="3 3" stroke="#e7e5e4" />
            <XAxis dataKey="month" tick={{ fontSize: 10 }} tickLine={false} />
            <YAxis tick={{ fontSize: 10 }} tickLine={false} axisLine={false} />
            <Tooltip content={<CustomTooltip />} />
            <Line type="monotone" dataKey="revenue" name="Выручка, ₽" stroke="#d97706" strokeWidth={2} dot={{ fill: '#d97706', r: 4 }} />
          </LineChart>
        </ResponsiveContainer>
      </div>

      <div className="grid grid-cols-2 gap-3">
        <div className="bg-white rounded-xl shadow-sm border border-stone-100 p-4">
          <h3 className="font-semibold text-xs mb-3">Источники лидов</h3>
          <ResponsiveContainer width="100%" height={160}>
            <PieChart>
              <Pie data={analytics.leadsBySource} dataKey="count" nameKey="source" cx="50%" cy="50%" innerRadius={30} outerRadius={60}>
                {analytics.leadsBySource.map((_, i) => (
                  <Cell key={i} fill={SOURCE_COLORS[i % SOURCE_COLORS.length]} />
                ))}
              </Pie>
              <Tooltip content={<CustomTooltip />} />
            </PieChart>
          </ResponsiveContainer>
          <div className="space-y-1 mt-2">
            {analytics.leadsBySource.map((s, i) => (
              <div key={s.source} className="flex items-center justify-between text-[10px]">
                <span className="flex items-center gap-1">
                  <span className="w-2 h-2 rounded-full inline-block" style={{ backgroundColor: SOURCE_COLORS[i] }} />
                  {s.source}
                </span>
                <span className="font-medium">{s.count} ({Math.round(s.count / totalLeadsBySource * 100)}%)</span>
              </div>
            ))}
          </div>
        </div>

        <div className="bg-white rounded-xl shadow-sm border border-stone-100 p-4">
          <h3 className="font-semibold text-xs mb-3">Категории запросов</h3>
          <ResponsiveContainer width="100%" height={160}>
            <PieChart>
              <Pie data={analytics.leadsByCategory} dataKey="count" nameKey="category" cx="50%" cy="50%" innerRadius={30} outerRadius={60}>
                {analytics.leadsByCategory.map((_, i) => (
                  <Cell key={i} fill={COLORS[i % COLORS.length]} />
                ))}
              </Pie>
              <Tooltip content={<CustomTooltip />} />
            </PieChart>
          </ResponsiveContainer>
          <div className="space-y-1 mt-2">
            {analytics.leadsByCategory.map((c, i) => (
              <div key={c.category} className="flex items-center justify-between text-[10px]">
                <span className="flex items-center gap-1">
                  <span className="w-2 h-2 rounded-full inline-block" style={{ backgroundColor: COLORS[i] }} />
                  {c.category}
                </span>
                <span className="font-medium">{c.count} ({Math.round(c.count / totalLeadsByCategory * 100)}%)</span>
              </div>
            ))}
          </div>
        </div>
      </div>

      <div className="bg-white rounded-xl shadow-sm border border-stone-100 p-4">
        <h3 className="font-semibold text-sm mb-3">Топ клиентов по объёму</h3>
        <div className="space-y-2">
          {analytics.topClients.map((c, i) => (
            <div key={c.name} className="flex items-center gap-3">
              <span className="w-5 h-5 rounded-full bg-amber-100 text-amber-700 text-[10px] flex items-center justify-center font-bold">
                {i + 1}
              </span>
              <div className="flex-1">
                <div className="flex justify-between text-xs mb-1">
                  <span className="font-medium">{c.name}</span>
                  <span className="text-stone-500">{c.volume} т</span>
                </div>
                <div className="w-full bg-stone-100 rounded-full h-1.5">
                  <div
                    className="bg-amber-600 h-1.5 rounded-full"
                    style={{ width: `${(c.volume / analytics.topClients[0].volume) * 100}%` }}
                  />
                </div>
              </div>
            </div>
          ))}
        </div>
      </div>
    </div>
  )
}
