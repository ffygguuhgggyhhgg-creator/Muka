import { useState } from 'react'

export type Shot = {
  /** путь от корня сайта, например /photo/melnitsa.jpg */
  src: string
  /** что именно на снимке: читают поисковики и программы для незрячих */
  alt: string
  /** подпись под фото, необязательна */
  caption?: string
  /** соотношение сторон, чтобы страница не прыгала во время загрузки */
  ratio?: string
}

type Props = Shot & {
  /** true только для снимка на первом экране: он грузится сразу */
  priority?: boolean
  /** вызывается, если файла нет: блок с этим фото убирается */
  onMissing?: () => void
}

/**
 * Фотография с честным поведением, когда файла ещё нет.
 * Пока снимок не положили в public/photo, вместо битой картинки
 * блок просто исчезает, а вёрстка вокруг остаётся целой.
 */
export default function Photo({
  src,
  alt,
  caption,
  ratio = '4 / 3',
  priority = false,
  onMissing,
}: Props) {
  const [missing, setMissing] = useState(false)
  if (missing) return null

  return (
    <figure className="pub-shot">
      <img
        src={src}
        alt={alt}
        style={{ aspectRatio: ratio }}
        loading={priority ? 'eager' : 'lazy'}
        decoding="async"
        fetchPriority={priority ? 'high' : 'auto'}
        onError={() => {
          setMissing(true)
          onMissing?.()
        }}
      />
      {caption ? <figcaption>{caption}</figcaption> : null}
    </figure>
  )
}
