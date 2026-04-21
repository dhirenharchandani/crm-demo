# Building

The app source is in `app.jsx` and compiled to `app.js` by `./build.sh`.

## Why is this committed?

GitHub Pages serves static files only — it doesn't run a build step on deploy.
So `app.js` needs to exist in the repo.

## Rebuilding after editing `app.jsx`

```bash
./build.sh
git add app.js app.jsx
git commit -m "…"
git push
```

## What does build.sh do?

Runs esbuild (via `npx`) to transform JSX → `React.createElement`, minify, and
write a source map. No `package.json` or `node_modules/` needed — esbuild is
fetched on demand.

## Pre-flight check before pushing

Open `index.html` via any local file server (e.g. `python3 -m http.server 9999`)
and confirm it renders without console errors.
