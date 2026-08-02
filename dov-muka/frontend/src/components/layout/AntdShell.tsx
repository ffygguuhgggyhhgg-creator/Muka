import { Outlet } from 'react-router-dom'
import { ConfigProvider } from 'antd'
import ruRU from 'antd/locale/ru_RU'

/**
 * Ant Design живёт только внутри этой обёртки.
 * Раздел, который её не использует (главная), не тянет библиотеку
 * в первый загружаемый файл, поэтому первый экран открывается быстрее.
 */
export default function AntdShell() {
  return (
    <ConfigProvider
      locale={ruRU}
      theme={{
        token: {
          colorPrimary: '#d4a843',
          colorSuccess: '#52c41a',
          borderRadius: 6,
        },
      }}
    >
      <Outlet />
    </ConfigProvider>
  )
}
