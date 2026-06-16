import { useState } from 'react'
import { useStore } from '../store'
import { Save, Bell, Globe, MessageCircle, FileText, RefreshCcw, Database, ToggleLeft, ToggleRight } from 'lucide-react'

export function Settings() {
  const settings = useStore(s => s.settings)
  const updateSettings = useStore(s => s.updateSettings)
  const [saved, setSaved] = useState(false)

  const handleSave = () => {
    setSaved(true)
    setTimeout(() => setSaved(false), 2000)
  }

  const toggle = (key: keyof typeof settings) => {
    if (typeof settings[key] === 'boolean') {
      updateSettings({ [key]: !settings[key] } as any)
    }
  }

  return (
    <div className="p-4 space-y-4 pb-8">
      <div className="flex items-center justify-between">
        <h2 className="text-lg font-bold">Настройки</h2>
        <button onClick={handleSave}
          className={`flex items-center gap-1 px-3 py-1.5 rounded-lg text-xs font-medium transition-colors ${
            saved ? 'bg-green-100 text-green-700' : 'bg-amber-900 text-white'
          }`}
        >
          <Save size={14} />
          {saved ? 'Сохранено!' : 'Сохранить'}
        </button>
      </div>

      <div className="bg-white rounded-xl shadow-sm border border-stone-100">
        <div className="px-4 py-3 border-b border-stone-100">
          <h3 className="font-semibold text-sm flex items-center gap-2">
            <Globe size={16} className="text-amber-700" />
            Источники мониторинга
          </h3>
        </div>
        <div className="divide-y divide-stone-100">
          {[
            { key: 'telegramEnabled' as const, label: 'Telegram', desc: 'Чаты пекарей, кондитеров, B2B', icon: MessageCircle, color: 'text-sky-600' },
            { key: 'vkEnabled' as const, label: 'VKontakte', desc: 'Группы пекарен, сообщества', icon: Globe, color: 'text-blue-600' },
            { key: 'forumsEnabled' as const, label: 'Форумы', desc: 'Хлебопекарные форумы, проф. сообщества', icon: FileText, color: 'text-stone-600' },
          ].map(source => (
            <div key={source.key} className="flex items-center gap-3 px-4 py-3">
              <source.icon size={18} className={source.color} />
              <div className="flex-1">
                <div className="text-sm font-medium">{source.label}</div>
                <div className="text-[10px] text-stone-400">{source.desc}</div>
              </div>
              <button onClick={() => toggle(source.key)}>
                {settings[source.key] ? (
                  <ToggleRight size={28} className="text-amber-700" />
                ) : (
                  <ToggleLeft size={28} className="text-stone-300" />
                )}
              </button>
            </div>
          ))}
        </div>
      </div>

      <div className="bg-white rounded-xl shadow-sm border border-stone-100">
        <div className="px-4 py-3 border-b border-stone-100">
          <h3 className="font-semibold text-sm flex items-center gap-2">
            <Bell size={16} className="text-amber-700" />
            Уведомления
          </h3>
        </div>
        <div className="divide-y divide-stone-100">
          {[
            { key: 'notificationSound' as const, label: 'Звук уведомлений', desc: 'Воспроизводить звук при новом лиде' },
            { key: 'autoResponse' as const, label: 'Автоответ', desc: 'Автоматический ответ на частые вопросы' },
            { key: 'workingHours' as const, label: 'Рабочее время', desc: 'Уведомления только в рабочее время' },
          ].map(item => (
            <div key={item.key} className="flex items-center gap-3 px-4 py-3">
              <div className="flex-1">
                <div className="text-sm font-medium">{item.label}</div>
                <div className="text-[10px] text-stone-400">{item.desc}</div>
              </div>
              <button onClick={() => toggle(item.key)}>
                {settings[item.key] ? (
                  <ToggleRight size={28} className="text-amber-700" />
                ) : (
                  <ToggleLeft size={28} className="text-stone-300" />
                )}
              </button>
            </div>
          ))}
        </div>
      </div>

      <div className="bg-white rounded-xl shadow-sm border border-stone-100">
        <div className="px-4 py-3 border-b border-stone-100">
          <h3 className="font-semibold text-sm flex items-center gap-2">
            <Database size={16} className="text-amber-700" />
            Интеграции
          </h3>
        </div>
        <div className="p-4 space-y-3">
          <div className="flex items-center justify-between">
            <div>
              <div className="text-sm font-medium">CRM (Битрикс24)</div>
              <div className="text-[10px] text-stone-400">Автоматическая отправка лидов</div>
            </div>
            <button onClick={() => toggle('crmIntegration')}>
              {settings.crmIntegration ? (
                <ToggleRight size={28} className="text-amber-700" />
              ) : (
                <ToggleLeft size={28} className="text-stone-300" />
              )}
            </button>
          </div>

          <div className="flex items-center justify-between">
            <div>
              <div className="text-sm font-medium">Telegram Bot</div>
              <div className="text-[10px] text-stone-400">Уведомления в Telegram</div>
            </div>
            <span className="text-[10px] text-green-600 bg-green-50 px-2 py-1 rounded-full">Подключено</span>
          </div>

          <div className="flex items-center justify-between">
            <div>
              <div className="text-sm font-medium">n8n Workflow</div>
              <div className="text-[10px] text-stone-400">Автоматизация процессов</div>
            </div>
            <span className="text-[10px] text-stone-500 bg-stone-100 px-2 py-1 rounded-full">Не подключено</span>
          </div>
        </div>
      </div>

      <div className="bg-white rounded-xl shadow-sm border border-stone-100">
        <div className="px-4 py-3 border-b border-stone-100">
          <h3 className="font-semibold text-sm flex items-center gap-2">
            <RefreshCcw size={16} className="text-amber-700" />
            Фильтрация лидов
          </h3>
        </div>
        <div className="p-4 space-y-3">
          <div>
            <div className="flex justify-between text-xs mb-1.5">
              <span className="font-medium">Минимальная релевантность</span>
              <span className="text-amber-700 font-bold">{settings.minRelevance}%</span>
            </div>
            <input
              type="range" min={0} max={100} value={settings.minRelevance}
              onChange={e => updateSettings({ minRelevance: Number(e.target.value) })}
              className="w-full h-2 bg-stone-100 rounded-full appearance-none cursor-pointer accent-amber-700"
            />
            <div className="flex justify-between text-[10px] text-stone-400 mt-0.5">
              <span>0%</span>
              <span>50%</span>
              <span>100%</span>
            </div>
          </div>
        </div>
      </div>

      <div className="bg-stone-100 rounded-xl p-4 text-center">
        <p className="text-[10px] text-stone-400">
          FlourRadar v1.0.0 • ТД Шихобалова<br />
          Система поиска B2B-клиентов
        </p>
      </div>
    </div>
  )
}
