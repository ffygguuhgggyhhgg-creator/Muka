export interface Product {
  id: string
  name: string
  description: string
  price: number
  unit: string
  category: string
  specs: Record<string, string>
  inStock: boolean
}

export interface Lead {
  id: string
  source: string
  sourceLabel: string
  message: string
  contactName: string
  contactUsername: string
  geo: string
  relevance: number
  urgency: 'high' | 'medium' | 'low'
  category: string
  volume?: string
  timestamp: string
  status: 'new' | 'in_progress' | 'qualified' | 'converted' | 'junk'
}

export interface Client {
  id: string
  name: string
  company: string
  phone: string
  email: string
  geo: string
  type: string
  status: 'active' | 'inactive' | 'lead'
  lastContact: string
  totalVolume: number
  revenue: number
}

export interface SalesData {
  month: string
  volume: number
  revenue: number
  plan: number
}

export interface AnalyticsData {
  totalLeads: number
  qualifiedLeads: number
  conversionRate: number
  activeClients: number
  monthlyVolume: number
  monthlyRevenue: number
  planFulfillment: number
  salesData: SalesData[]
  leadsBySource: { source: string; count: number }[]
  leadsByCategory: { category: string; count: number }[]
  topClients: { name: string; volume: number }[]
}

export interface KeywordGroup {
  name: string
  keywords: string[]
  enabled: boolean
}

export interface AppSettings {
  telegramEnabled: boolean
  vkEnabled: boolean
  forumsEnabled: boolean
  notificationSound: boolean
  autoResponse: boolean
  workingHours: boolean
  crmIntegration: boolean
  keywords: KeywordGroup[]
  stopWords: string[]
  minRelevance: number
}
