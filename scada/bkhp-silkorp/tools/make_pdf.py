#!/usr/bin/env python3
"""Render the project documentation to PDF (A4, Cyrillic, print CSS).

Usage:
    python3 tools/make_pdf.py                 # all documents + combined report
    python3 tools/make_pdf.py docs/03-*.md    # only the given files
"""
import os
import re
import sys

import markdown
from weasyprint import HTML

OUT = 'docs/pdf'
PROJECT = 'БКХП «SilKorp» — проект Simple-Scada 2'

# Colour-coded severity markers: the coloured-circle emoji have no glyph in the
# document fonts, so they are replaced with a styled bullet that always renders.
SEVERITY = {'🔴': 'crit', '🟠': 'high', '🟡': 'mid', '🟢': 'low'}

CSS = """
@page {
  size: A4;
  margin: 18mm 14mm 16mm 14mm;
  @top-right   { content: string(doctitle); font: 7.5pt "DejaVu Sans"; color: #777; }
  @bottom-left { content: "%(project)s"; font: 7.5pt "DejaVu Sans"; color: #777; }
  @bottom-right{ content: counter(page) " / " counter(pages);
                 font: 7.5pt "DejaVu Sans"; color: #777; }
}
body { font: 9.5pt/1.45 "DejaVu Sans"; color: #1a1a1a; hyphens: none; }
h1 { string-set: doctitle content(); font-size: 17pt; margin: 0 0 4mm;
     padding-bottom: 2mm; border-bottom: 1.2pt solid #333; page-break-after: avoid; }
h2 { font-size: 13pt; margin: 7mm 0 2.5mm; page-break-after: avoid;
     border-bottom: 0.5pt solid #bbb; padding-bottom: 1mm; }
h3 { font-size: 11pt; margin: 5mm 0 2mm; page-break-after: avoid; }
h4 { font-size: 10pt; margin: 4mm 0 1.5mm; page-break-after: avoid; }
p, li { orphans: 2; widows: 2; }
ul, ol { margin: 2mm 0 2mm 6mm; padding: 0; }
li { margin-bottom: 0.8mm; }
code { font-family: "DejaVu Sans Mono"; font-size: 8.2pt;
       background: #f2f2f2; padding: 0 1pt; border-radius: 2pt; }
pre { font-family: "DejaVu Sans Mono"; font-size: 7.2pt; line-height: 1.32;
      background: #f7f7f7; border: 0.5pt solid #ddd; border-left: 2pt solid #999;
      padding: 2mm 2.5mm; margin: 2.5mm 0; white-space: pre;
      page-break-inside: avoid; }
pre code { font-size: inherit; background: none; padding: 0; }
table { width: 100%%; border-collapse: collapse; font-size: 8pt;
        margin: 2.5mm 0; table-layout: auto; }
thead { display: table-header-group; }
th, td { border: 0.5pt solid #c8c8c8; padding: 1.1mm 1.6mm;
         text-align: left; vertical-align: top; word-wrap: break-word; }
th { background: #ececec; font-weight: bold; }
tr { page-break-inside: avoid; }
td code, th code { font-size: 7.4pt; background: none; padding: 0; }
blockquote { margin: 2.5mm 0; padding: 1.5mm 3mm; background: #fff8e6;
             border-left: 2pt solid #d9a400; font-size: 9pt; }
blockquote p { margin: 0.8mm 0; }
hr { border: none; border-top: 0.5pt solid #ccc; margin: 5mm 0; }
strong { font-weight: bold; }
a { color: #1a1a1a; text-decoration: none; }
.sev { font-size: 9pt; }
.sev-crit { color: #c62828; }
.sev-high { color: #e65100; }
.sev-mid  { color: #b58900; }
.sev-low  { color: #2e7d32; }
.toc-title { font-size: 17pt; margin-bottom: 4mm; }
.toc div { margin-bottom: 0.6mm; }
.toc a { color: #1a1a1a; }
.toc a::after { content: " " leader('.') " " target-counter(attr(href), page);
                color: #666; }
.toc-h1 { margin-top: 2.5mm; font-weight: bold; }
.toc-h2 { margin-left: 6mm; }
.toc-h3 { margin-left: 12mm; font-size: 8.5pt; color: #444; }
.docbreak { page-break-before: always; }
""" % {'project': PROJECT}


def preprocess(text):
    for emoji, cls in SEVERITY.items():
        text = text.replace(emoji, f'<span class="sev sev-{cls}">●</span>')
    # local .md links would be dead in a PDF — keep the label, drop the target
    text = re.sub(r'\[([^\]]+)\]\((?![a-z]+://)[^)]*\.md[^)]*\)', r'\1', text)
    return text


def to_html(text):
    return markdown.markdown(
        preprocess(text),
        extensions=['tables', 'fenced_code', 'sane_lists', 'attr_list'])


def anchor_headings(html, counter, toc):
    """Give every h1-h3 an id and collect table-of-contents entries."""
    def repl(m):
        lvl, attrs, inner = m.group(1), m.group(2), m.group(3)
        counter[0] += 1
        hid = f'h{counter[0]}'
        title = re.sub(r'<[^>]+>', '', inner)
        title = re.sub(r'[`*\\]', '', title).strip()
        toc.append((int(lvl), title, hid))
        return f'<h{lvl} id="{hid}"{attrs}>{inner}</h{lvl}>'

    return re.sub(r'<h([123])([^>]*)>(.*?)</h\1>', repl, html, flags=re.S)


def render(md_paths, out_pdf, toc_title=None):
    parts, toc, counter = [], [], [0]
    for i, p in enumerate(md_paths):
        body = to_html(open(p, encoding='utf-8').read())
        if toc_title:
            body = anchor_headings(body, counter, toc)
        cls = ' class="docbreak"' if (i or toc_title) else ''
        parts.append(f'<div{cls}>{body}</div>')
    if toc_title:
        items = ''.join(
            f'<div class="toc-h{lvl}"><a href="#{hid}">{title}</a></div>'
            for lvl, title, hid in toc)
        parts.insert(0, f'<h1 class="toc-title">{toc_title}</h1>'
                        f'<div class="toc">{items}</div>')
    html = ('<!DOCTYPE html><html lang="ru"><head><meta charset="utf-8">'
            f'<style>{CSS}</style></head><body>{"".join(parts)}</body></html>')
    os.makedirs(os.path.dirname(out_pdf), exist_ok=True)
    HTML(string=html, base_url='.').write_pdf(out_pdf)
    return out_pdf


MAIN = ['docs/01-описание-проекта.md',
        'docs/02-схема-взаимосвязей.md',
        'docs/03-алгоритмы.md',
        'docs/04-таблица-переменных.md',
        'docs/05-ошибки-и-исправления.md']
REFS = ['docs/reference/coverage.md',
        'docs/reference/io-map.md',
        'docs/reference/scripts.md',
        'docs/reference/variables.md']

if __name__ == '__main__':
    if len(sys.argv) > 1:
        for p in sys.argv[1:]:
            out = f'{OUT}/{os.path.splitext(os.path.basename(p))[0]}.pdf'
            print(render([p], out))
        raise SystemExit
    for p in MAIN:
        print(render([p], f'{OUT}/{os.path.splitext(os.path.basename(p))[0]}.pdf'))
    for p in REFS:
        name = os.path.splitext(os.path.basename(p))[0]
        print(render([p], f'{OUT}/reference/{name}.pdf'))
    print(render(MAIN + REFS,
                 f'{OUT}/БКХП-SilKorp-полный-отчёт.pdf',
                 toc_title='БКХП «SilKorp» — анализ проекта АСУ ТП\n'))
