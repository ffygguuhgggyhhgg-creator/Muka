#!/bin/sh
# Собирает RAR-архив со всем результатом разбора проекта.
# Запуск из каталога scada/bkhp-silkorp:  sh tools/make_archive.sh
set -e
NAME="BKHP_SILKORP_анализ_и_исправления"
STAGE="$(mktemp -d)/$NAME"
mkdir -p "$STAGE"

cp -r README.md docs decoded fixes project tools BKHP_SILKORP_original.rar "$STAGE/"
cp ЧИТАЙ-МЕНЯ.txt "$STAGE/" 2>/dev/null || true
rm -rf "$STAGE/docs/pdf/.keep"

OUT="$PWD/$NAME.rar"
rm -f "$OUT"
( cd "$(dirname "$STAGE")" && rar a -r -m5 -idq "$OUT" "$NAME" )
rm -rf "$(dirname "$STAGE")"
ls -lh "$OUT"
