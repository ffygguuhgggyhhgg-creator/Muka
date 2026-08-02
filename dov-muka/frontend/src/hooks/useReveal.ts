import { useEffect, useRef } from 'react'

/**
 * Показывает элементы с атрибутом data-reveal, когда они попадают в кадр.
 * Вешается один раз на секцию-контейнер, наблюдателей на каждый элемент не плодит.
 *
 * Если IntersectionObserver недоступен или человек просил убрать анимации,
 * всё показывается сразу: контент важнее эффекта.
 */
export function useReveal<T extends HTMLElement>() {
  const ref = useRef<T>(null)

  useEffect(() => {
    const root = ref.current
    if (!root) return

    const items = Array.from(root.querySelectorAll<HTMLElement>('[data-reveal]'))
    if (items.length === 0) return

    const reduced = window.matchMedia('(prefers-reduced-motion: reduce)').matches
    if (reduced || !('IntersectionObserver' in window)) {
      items.forEach((el) => el.classList.add('is-in'))
      return
    }

    const io = new IntersectionObserver(
      (entries) => {
        entries.forEach((entry) => {
          if (!entry.isIntersecting) return
          entry.target.classList.add('is-in')
          io.unobserve(entry.target)
        })
      },
      { rootMargin: '0px 0px -8% 0px', threshold: 0.1 },
    )

    items.forEach((el) => io.observe(el))
    return () => io.disconnect()
  }, [])

  return ref
}
