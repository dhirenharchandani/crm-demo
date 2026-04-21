#!/bin/bash
# Compile app.jsx -> app.js (minified, JSX transformed to React.createElement)
# Run this whenever app.jsx changes. Output app.js is committed to the repo so
# GitHub Pages serves it directly — no build step on deploy.
set -euo pipefail
cd "$(dirname "$0")"
npx --yes esbuild@0.24.0 app.jsx \
  --bundle=false \
  --loader:.jsx=jsx \
  --jsx=transform \
  --jsx-factory=React.createElement \
  --jsx-fragment=React.Fragment \
  --target=es2019 \
  --minify \
  --sourcemap \
  --outfile=app.js
echo "OK: $(wc -c < app.js) bytes"
