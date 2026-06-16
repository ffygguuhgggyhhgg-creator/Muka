import { useState } from 'react'
import { useStore } from '../store'
import { Package, ChevronDown, ChevronUp, ShoppingCart } from 'lucide-react'

export function Catalog() {
  const products = useStore(s => s.products)
  const [expandedId, setExpandedId] = useState<string | null>(null)

  return (
    <div className="p-4 space-y-4">
      <div className="flex items-center justify-between">
        <h2 className="text-lg font-bold">Каталог продукции</h2>
        <span className="text-[10px] text-stone-400 bg-stone-100 px-2 py-1 rounded-full">
          {products.length} позиций
        </span>
      </div>

      <div className="bg-amber-900 text-white rounded-xl p-4">
        <div className="flex items-center gap-3">
          <div className="w-12 h-12 rounded-xl bg-amber-800 flex items-center justify-center">
            <Package size={24} />
          </div>
          <div>
            <h3 className="font-bold">Мука от ТД Шихобалова</h3>
            <p className="text-[11px] text-amber-200/80">
              Производство 9 000 т/мес • Клейковина от 25%
            </p>
          </div>
        </div>
        <div className="mt-3 flex gap-2 text-[10px]">
          <span className="bg-amber-800 px-2 py-1 rounded-full">Упаковка: мешки 25/50 кг</span>
          <span className="bg-amber-800 px-2 py-1 rounded-full">Биг-бэги 1 т</span>
          <span className="bg-amber-800 px-2 py-1 rounded-full">Насыпь</span>
        </div>
      </div>

      <div className="space-y-3">
        {products.map(p => {
          const expanded = expandedId === p.id
          return (
            <div key={p.id} className="bg-white rounded-xl border border-stone-100 shadow-sm overflow-hidden">
              <div className="p-3.5">
                <div className="flex justify-between items-start">
                  <div className="flex-1">
                    <h3 className="font-semibold text-sm">{p.name}</h3>
                    <p className="text-xs text-stone-400 mt-0.5">{p.description}</p>
                  </div>
                  <div className="text-right">
                    <div className="text-base font-bold text-amber-900">
                      {p.price.toLocaleString()} ₽
                    </div>
                    <div className="text-[10px] text-stone-400">за {p.unit}</div>
                  </div>
                </div>

                <div className="flex items-center gap-2 mt-2">
                  {p.inStock ? (
                    <span className="text-[10px] text-green-600 bg-green-50 px-2 py-0.5 rounded-full font-medium">
                      В наличии
                    </span>
                  ) : (
                    <span className="text-[10px] text-red-600 bg-red-50 px-2 py-0.5 rounded-full font-medium">
                      Под заказ
                    </span>
                  )}
                  <span className="text-[10px] text-stone-400 bg-stone-100 px-2 py-0.5 rounded-full">
                    {p.category}
                  </span>
                </div>

                {expanded && (
                  <div className="mt-3 pt-3 border-t border-stone-100">
                    <h4 className="text-xs font-medium text-stone-500 mb-2">Характеристики</h4>
                    <div className="grid grid-cols-2 gap-2">
                      {Object.entries(p.specs).map(([key, val]) => (
                        <div key={key} className="bg-stone-50 rounded-lg p-2 text-xs">
                          <span className="text-stone-400">{key}</span>
                          <p className="font-medium">{val}</p>
                        </div>
                      ))}
                    </div>
                    <div className="mt-3 flex gap-2">
                      <button className="flex-1 bg-amber-900 text-white text-xs py-2 rounded-lg font-medium flex items-center justify-center gap-1">
                        <ShoppingCart size={14} /> Заказать
                      </button>
                      <button className="flex-1 bg-stone-100 text-stone-600 text-xs py-2 rounded-lg font-medium">
                        Образцы
                      </button>
                    </div>
                  </div>
                )}
              </div>

              <button onClick={() => setExpandedId(expanded ? null : p.id)}
                className="w-full py-1.5 flex items-center justify-center gap-1 text-[10px] text-stone-400 bg-stone-50 border-t border-stone-100">
                {expanded ? 'Свернуть' : 'Характеристики'}
                {expanded ? <ChevronUp size={12} /> : <ChevronDown size={12} />}
              </button>
            </div>
          )
        })}
      </div>

      <div className="bg-white rounded-xl border border-stone-100 shadow-sm p-4">
        <h3 className="font-semibold text-sm mb-2">Ценовые условия</h3>
        <div className="space-y-2 text-xs text-stone-600">
          <div className="flex justify-between">
            <span>Цены указаны EXW Самара</span>
            <span className="font-medium text-stone-900">Базовые</span>
          </div>
          <div className="flex justify-between">
            <span>Скидка от 500 т/мес</span>
            <span className="font-medium text-green-600">-2%</span>
          </div>
          <div className="flex justify-between">
            <span>Скидка от 1 000 т/мес</span>
            <span className="font-medium text-green-600">-3-5%</span>
          </div>
          <div className="flex justify-between">
            <span>Долгосрочный контракт (6+ мес)</span>
            <span className="font-medium text-green-600">Фиксация цены</span>
          </div>
        </div>
      </div>
    </div>
  )
}
