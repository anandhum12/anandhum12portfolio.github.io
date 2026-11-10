#!/bin/sh
# Builds index.html (self-hosting, image loaded from assets/) and body.html (preview, image inlined).
cd "$(dirname "$0")"
{ printf '<!doctype html>\n<html lang="en">\n<head>\n<meta charset="utf-8">\n<meta name="viewport" content="width=device-width, initial-scale=1, viewport-fit=cover">\n'
  sed -n '1,/<\/style>/p' src.html; printf '</head>\n<body>\n'
  sed '1,/<\/style>/d' src.html; printf '</body>\n</html>\n'; } > index.html
B64=$(base64 -i assets/icict-2025-certificate.jpg | tr -d '\n')
sed "s#src=\"assets/icict-2025-certificate.jpg\"#src=\"data:image/jpeg;base64,$B64\"#" src.html > body.html
