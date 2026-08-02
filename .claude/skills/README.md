# Дизайн-скиллы проекта

Три скилла, установленные локально в репозиторий. Claude Code подхватывает их
автоматически из `.claude/skills/`, отдельная установка не нужна.

## Что стоит

| Скилл | Что делает | Источник | Лицензия |
|---|---|---|---|
| `emil-design-eng` | Инстинкт design engineer: когда анимировать и когда нет, кривые easing, тайминги (кнопка 100-160 мс, дропдаун 150-250 мс, модалка 200-500 мс), spring-физика, обязательный разбор в таблице Before/After/Why | [emilkowalski/skills](https://github.com/emilkowalski/skills) | MIT |
| `impeccable` | 20+ подкоманд `craft · shape · audit · critique · polish · layout · typeset · colorize · animate · harden · distill · bolder · quieter` плюс агенты и скрипты детекторов | [pbakaus/impeccable](https://github.com/pbakaus/impeccable) | Apache-2.0 |
| `design-taste-frontend` | Image-first вкус: чтение брифа, три «ручки» интенсивности, каталог anti-slop, pre-flight перед сдачей | [h3nryprod01/design-taste](https://github.com/h3nryprod01/design-taste) | MIT (reference/ частично Apache-2.0) |

Тексты скиллов взяты из upstream без изменений. Две правки сделаны только ради
запуска в этом репозитории:

- `design-taste-frontend/SKILL.md`: поле `name` переименовано с `design-taste`,
  чтобы имя совпадало с папкой и вызовом `/design-taste-frontend`.
- Файлы лицензий и `NOTICE` скопированы рядом с каждым скиллом.

## Как запускать

Одной строкой, в порядке применения:

```
/design-taste-frontend /emil-design-eng /impeccable
```

Порядок имеет значение и соответствует тому, как они работают вместе:

1. **design-taste-frontend** читает бриф и задаёт направление: палитру,
   типографику, плотность. Отвечает на вопрос «как это должно выглядеть».
2. **emil-design-eng** отвечает за ощущение: тайминги, easing, состояния
   кнопок, что вообще не должно анимироваться.
3. **impeccable** закрывает работу: `audit` для контраста, адаптива и
   доступности, `polish` для финального прохода.

Каждый вызывается и отдельно, например `/impeccable audit docs/redesign-preview`.

## Что ими сделано

`docs/redesign-preview/index.html` - главная страница ТД Шихобалова,
пересобранная по этим трём скиллам. Открывается как обычный файл в браузере,
сборка не нужна.
