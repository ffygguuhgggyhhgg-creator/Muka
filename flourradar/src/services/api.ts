import type { Lead, Client, Product, AnalyticsData, AppSettings } from '../types'

const BASE_URL = import.meta.env.VITE_API_URL || 'http://localhost:8000'

let useApi = false

export function setUseApi(flag: boolean) {
  useApi = flag
}

export function getUseApi() {
  return useApi
}

const mockLeads: Lead[] = [
  { id: 'l1', source: 'telegram', sourceLabel: 'Чат «Пекари Москвы»', message: 'Срочно нужна мука пшеничная оптом, постоянные объемы 5 тонн/месяц', contactName: 'Александр', contactUsername: '@bakery_owner', geo: 'Москва', relevance: 95, urgency: 'high', category: 'Прямой спрос', volume: '5 т/мес', timestamp: new Date(Date.now() - 5 * 60000).toISOString(), status: 'new' },
  { id: 'l2', source: 'vkontakte', sourceLabel: 'Сообщество пекарен', message: 'Ищем надёжного поставщика муки для сети пекарен. Объём от 10 тонн/мес', contactName: 'Елена', contactUsername: '@elena_baker', geo: 'Санкт-Петербург', relevance: 88, urgency: 'medium', category: 'Поиск поставщика', volume: '10 т/мес', timestamp: new Date(Date.now() - 15 * 60000).toISOString(), status: 'new' },
  { id: 'l3', source: 'telegram', sourceLabel: 'Чат кондитеров', message: 'Коллеги, кто работает с Самарой? Нужна мука в/с для кондитерки', contactName: 'Мария', contactUsername: '@maria_confection', geo: 'Казань', relevance: 72, urgency: 'medium', category: 'Косвенный спрос', timestamp: new Date(Date.now() - 45 * 60000).toISOString(), status: 'new' },
  { id: 'l4', source: 'forum', sourceLabel: 'Форум хлебопеков', message: 'Открываем новую пекарню в Нижнем Новгороде. Ищем поставщиков муки', contactName: 'Дмитрий', contactUsername: 'dmitry_bread', geo: 'Нижний Новгород', relevance: 65, urgency: 'low', category: 'Новый бизнес', timestamp: new Date(Date.now() - 120 * 60000).toISOString(), status: 'in_progress' },
  { id: 'l5', source: 'telegram', sourceLabel: 'B2B чат закупщиков', message: 'Сменили поставщика, качество не устроило. Нужна альтернатива, объёмы 3-5 т', contactName: 'Сергей', contactUsername: '@sergey_food', geo: 'Самара', relevance: 91, urgency: 'high', category: 'Смена поставщика', volume: '3-5 т/мес', timestamp: new Date(Date.now() - 8 * 60000).toISOString(), status: 'new' },
  { id: 'l6', source: 'vkontakte', sourceLabel: 'Оборудование для пекарен', message: 'Запускаем производство замороженных полуфабрикатов, нужна мука', contactName: 'Татьяна', contactUsername: '@tanya_prod', geo: 'Екатеринбург', relevance: 78, urgency: 'medium', category: 'Новое производство', timestamp: new Date(Date.now() - 60 * 60000).toISOString(), status: 'new' },
]

const mockClients: Client[] = [
  { id: 'c1', name: 'Иван Петров', company: 'Хлебзавод №1', phone: '+7 (846) 123-45-67', email: 'ivan@hleb1.ru', geo: 'Самара', type: 'Хлебозавод', status: 'active', lastContact: '2026-06-10', totalVolume: 120, revenue: 3600000 },
  { id: 'c2', name: 'Ольга Смирнова', company: 'Кондитерская «Сладко»', phone: '+7 (846) 234-56-78', email: 'olga@sladko.ru', geo: 'Тольятти', type: 'Кондитерская', status: 'active', lastContact: '2026-06-08', totalVolume: 45, revenue: 1275000 },
  { id: 'c3', name: 'Петр Иванов', company: 'Макаронная фабрика', phone: '+7 (846) 345-67-89', email: 'petr@makaron.ru', geo: 'Саратов', type: 'Макаронное производство', status: 'inactive', lastContact: '2026-05-20', totalVolume: 200, revenue: 5400000 },
]

const mockProducts: Product[] = [
  { id: '1', name: 'Мука пшеничная в/с', description: 'Высший сорт, клейковина 28-30%, белизна 58-62 ед.', price: 30000, unit: 'т', category: 'Пшеничная', specs: { 'Клейковина': '28-30%', 'Влажность': '≤14.5%', 'Зольность': '0.55%', 'Белизна': '58-62 ед.' }, inStock: true },
  { id: '2', name: 'Мука пшеничная 1 сорт', description: 'Первый сорт, клейковина 25-27%, для массового хлеба', price: 26500, unit: 'т', category: 'Пшеничная', specs: { 'Клейковина': '25-27%', 'Влажность': '≤14.5%', 'Зольность': '0.75%', 'Белизна': '48-52 ед.' }, inStock: true },
  { id: '3', name: 'Мука ржаная обдирная', description: 'Для ржаного хлеба и заквасок', price: 22000, unit: 'т', category: 'Ржаная', specs: { 'Зольность': '1.45%', 'Влажность': '≤15%', 'Кислотность': '≤5°' }, inStock: true },
  { id: '4', name: 'Мука цельнозерновая', description: 'Из цельного зерна, высокая пищевая ценность', price: 28000, unit: 'т', category: 'Пшеничная', specs: { 'Клейковина': '22-25%', 'Влажность': '≤14.5%' }, inStock: true },
]

const mockAnalytics: AnalyticsData = {
  totalLeads: 47, qualifiedLeads: 23, conversionRate: 32, activeClients: 18,
  monthlyVolume: 5200, monthlyRevenue: 146000000, planFulfillment: 87,
  salesData: [
    { month: 'Янв', volume: 4200, revenue: 117600000, plan: 5000 },
    { month: 'Фев', volume: 4500, revenue: 126000000, plan: 5000 },
    { month: 'Мар', volume: 4800, revenue: 134400000, plan: 5500 },
    { month: 'Апр', volume: 5100, revenue: 142800000, plan: 5500 },
    { month: 'Май', volume: 4900, revenue: 137200000, plan: 5500 },
    { month: 'Июн', volume: 5200, revenue: 146000000, plan: 6000 },
  ],
  leadsBySource: [
    { source: 'Telegram', count: 156 }, { source: 'VKontakte', count: 89 },
    { source: 'Форумы', count: 34 }, { source: 'WhatsApp', count: 45 },
    { source: 'Прочее', count: 23 },
  ],
  leadsByCategory: [
    { category: 'Прямой спрос', count: 98 }, { category: 'Поиск поставщика', count: 76 },
    { category: 'Смена поставщика', count: 45 }, { category: 'Новый бизнес', count: 34 },
    { category: 'Косвенный спрос', count: 94 },
  ],
  topClients: [
    { name: 'Хлебзавод №1', volume: 480 }, { name: 'Пекарня «Добрый хлеб»', volume: 320 },
    { name: 'Макаронная фабрика', volume: 280 }, { name: 'Кондитерская «Сладко»', volume: 180 },
    { name: 'Сеть пекарен «Каравай»', volume: 150 },
  ],
}

async function apiFetch<T>(endpoint: string, options?: RequestInit): Promise<T> {
  if (!useApi) {
    throw new Error('API disabled')
  }
  const res = await fetch(`${BASE_URL}${endpoint}`, {
    headers: { 'Content-Type': 'application/json' },
    ...options,
  })
  if (!res.ok) throw new Error(`API error: ${res.status}`)
  return res.json()
}

export async function fetchLeads(): Promise<Lead[]> {
  try {
    return await apiFetch<Lead[]>('/api/leads')
  } catch {
    return mockLeads
  }
}

export async function fetchClients(): Promise<Client[]> {
  try {
    return await apiFetch<Client[]>('/api/clients')
  } catch {
    return mockClients
  }
}

export async function fetchProducts(): Promise<Product[]> {
  try {
    return await apiFetch<Product[]>('/api/products')
  } catch {
    return mockProducts
  }
}

export async function fetchAnalytics(): Promise<AnalyticsData> {
  try {
    return await apiFetch<AnalyticsData>('/api/analytics')
  } catch {
    return mockAnalytics
  }
}

export async function updateLeadStatus(id: string, status: Lead['status']): Promise<Lead> {
  try {
    return await apiFetch<Lead>(`/api/leads/${id}/status`, {
      method: 'PATCH',
      body: JSON.stringify({ status }),
    })
  } catch {
    return { ...mockLeads.find(l => l.id === id)!, status }
  }
}

export async function updateSettings(settings: Partial<AppSettings>): Promise<AppSettings> {
  try {
    return await apiFetch<AppSettings>('/api/settings', {
      method: 'PATCH',
      body: JSON.stringify(settings),
    })
  } catch {
    return settings as AppSettings
  }
}
