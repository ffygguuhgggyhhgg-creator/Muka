import { useState } from 'react'
import { Link } from 'react-router-dom'
import Photo, { type Shot } from '../../components/Photo'
import { useReveal } from '../../hooks/useReveal'
import { PHONE, PHONE_HREF } from '../../components/layout/PublicHeader'

const products = [
  'Мука высшего сорта',
  'Мука первого сорта',
  'Отруби пшеничные',
  'Зернопродукт',
]

const advantages = [
  {
    title: 'Качество ГОСТ',
    desc: 'Вся продукция сертифицирована и соответствует ГОСТ',
  },
  {
    title: 'Собственная логистика',
    desc: 'Парк техники и речной причал для отгрузки',
  },
  {
    title: 'Более 20 лет на рынке',
    desc: 'Надёжный поставщик муки в Поволжье',
  },
]

const stats = [
  { label: 'Производство муки', value: '200', unit: 'т/сут' },
  { label: 'Производство отрубей', value: '70', unit: 'т/сут' },
  { label: 'Хранение зерна', value: '50', unit: 'тыс. т' },
  { label: 'Лет на рынке', value: '20', unit: 'и больше' },
]

/**
 * Снимки производства. Положите файлы в frontend/public/photo/
 * с этими именами, и раздел появится сам. Пока файлов нет,
 * раздел не отображается: пустых рамок и битых картинок на сайте не будет.
 */
const productionShots: Shot[] = [
  {
    src: '/photo/melnitsa.jpg',
    alt: 'Размольный цех мукомольного завода',
    caption: 'Размольный цех',
  },
  {
    src: '/photo/elevator.jpg',
    alt: 'Элеватор для хранения зерна',
    caption: 'Элеватор на 50 000 тонн',
  },
  {
    src: '/photo/otgruzka.jpg',
    alt: 'Погрузка муки в муковоз',
    caption: 'Отгрузка муковозом',
  },
]

export default function HomePage() {
  const reveal = useReveal<HTMLDivElement>()
  const [shots, setShots] = useState(productionShots)

  return (
    <div ref={reveal}>
      <section className="pub-hero on-gold">
        <div className="wrap pub-hero-in">
          <h1>Крупнейший мукомольный завод Самарской области</h1>
          <p>
            Производим до 200 тонн муки и 70 тонн отрубей в сутки.
            Работаем с 2004 года.
          </p>
          <div className="pub-hero-actions">
            <Link className="pub-btn" to="/catalog">Каталог продукции</Link>
            <Link className="pub-btn pub-btn--line" to="/contacts">Стать партнёром</Link>
          </div>
        </div>
        <div className="pub-strip">
          {products.map((name) => <span key={name}>{name}</span>)}
        </div>
      </section>

      <section className="pub-adv">
        <div className="wrap pub-adv-grid">
          {advantages.map((item, i) => (
            <div
              className="pub-adv-item"
              key={item.title}
              data-reveal
              style={{ '--d': `${i * 70}ms` } as React.CSSProperties}
            >
              <span className="bar" />
              <h3>{item.title}</h3>
              <p>{item.desc}</p>
            </div>
          ))}
        </div>
      </section>

      {shots.length > 0 && (
        <section className="pub-shots">
          <div className="wrap pub-shots-grid">
            {shots.map((shot, i) => (
              <div
                key={shot.src}
                data-reveal
                style={{ '--d': `${i * 70}ms` } as React.CSSProperties}
              >
                <Photo
                  {...shot}
                  onMissing={() =>
                    setShots((rest) => rest.filter((s) => s.src !== shot.src))
                  }
                />
              </div>
            ))}
          </div>
        </section>
      )}

      <section className="pub-stats on-navy">
        <div className="wrap">
          <h2 data-reveal>Наши показатели</h2>
          <p className="pub-stats-lede" data-reveal style={{ '--d': '60ms' } as React.CSSProperties}>
            Мощности загружены круглый год: собственное хранение зерна снимает
            зависимость от сезона закупки.
          </p>
          <dl className="pub-stats-grid">
            {stats.map((stat, i) => (
              <div
                className="pub-stat"
                key={stat.label}
                data-reveal
                style={{ '--d': `${60 + i * 60}ms` } as React.CSSProperties}
              >
                <dt>{stat.label}</dt>
                <dd>{stat.value}<i>{stat.unit}</i></dd>
              </div>
            ))}
          </dl>
        </div>
      </section>

      <section className="pub-cta">
        <div className="wrap pub-cta-in">
          <div data-reveal>
            <h2>Готовы начать сотрудничество?</h2>
            <p>Оставьте заявку, и наш менеджер свяжется с вами в течение часа.</p>
          </div>
          <div className="pub-cta-side" data-reveal style={{ '--d': '70ms' } as React.CSSProperties}>
            <a className="pub-tel" href={PHONE_HREF}>{PHONE}</a>
            <Link className="pub-btn" to="/contacts">Связаться с нами</Link>
          </div>
        </div>
      </section>
    </div>
  )
}
