import { Link } from 'react-router-dom'
import { PHONE, PHONE_HREF, EMAIL } from './PublicHeader'

export default function PublicFooter() {
  return (
    <footer className="pub-foot on-navy">
      <div className="wrap">
        <div className="pub-foot-grid">
          <div className="pub-foot-col brand">
            <b>ТД Шихобалова</b>
            <p>Крупнейший мукомольный завод</p>
            <p>Самарской области</p>
          </div>

          <div className="pub-foot-col">
            <b>Контакты</b>
            <a href={PHONE_HREF}>{PHONE}</a>
            <a href={`mailto:${EMAIL}`}>{EMAIL}</a>
            <p>г. Самара, ул. Заводская, 1</p>
          </div>

          <div className="pub-foot-col">
            <b>Продукция</b>
            <Link to="/catalog">Мука в/с</Link>
            <Link to="/catalog">Мука 1 сорт</Link>
            <Link to="/catalog">Отруби</Link>
          </div>
        </div>

        <p className="pub-foot-bottom">
          © {new Date().getFullYear()} ООО «ТД Шихобалова». Все права защищены.
        </p>
      </div>
    </footer>
  )
}
