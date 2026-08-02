import { NavLink, Link } from 'react-router-dom'

const menu = [
  { to: '/', label: 'Главная', end: true },
  { to: '/catalog', label: 'Каталог', end: false },
  { to: '/about', label: 'О компании', end: false },
  { to: '/contacts', label: 'Контакты', end: false },
]

export const PHONE = '+7 (846) 123-45-67'
export const PHONE_HREF = 'tel:+78461234567'
export const EMAIL = 'info@dov-muka.ru'

export default function PublicHeader() {
  return (
    <header className="pub-top">
      <div className="wrap pub-top-in">
        <Link className="pub-mark" to="/">
          <img src="/logo.svg" alt="" width={40} height={40} />
          <span>
            <b>ТД Шихобалова</b>
            <span className="sub">Мукомольный завод</span>
          </span>
        </Link>

        <nav className="pub-nav" aria-label="Разделы сайта">
          {menu.map((item) => (
            <NavLink
              key={item.to}
              to={item.to}
              end={item.end}
              className={({ isActive }) => (isActive ? 'is-active' : undefined)}
            >
              {item.label}
            </NavLink>
          ))}
        </nav>

        <div className="pub-top-side">
          <a className="pub-tel" href={PHONE_HREF}>{PHONE}</a>
          <Link className="pub-btn pub-btn--line pub-btn--sm" to="/login">Войти</Link>
        </div>
      </div>
    </header>
  )
}
