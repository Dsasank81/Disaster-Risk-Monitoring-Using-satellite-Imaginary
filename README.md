# Disaster Globe (Flask) — Galaxy Globe for Disaster Risk Monitoring

[![CI](https://github.com/<your-username>/disaster-globe-flask/actions/workflows/ci.yml/badge.svg)](https://github.com/<your-username>/disaster-globe-flask/actions/workflows/ci.yml)
[![CD](https://github.com/<your-username>/disaster-globe-flask/actions/workflows/cd.yml/badge.svg)](https://github.com/<your-username>/disaster-globe-flask/actions/workflows/cd.yml)
[![Pages](https://github.com/<your-username>/disaster-globe-flask/actions/workflows/gh-pages.yml/badge.svg)](https://github.com/<your-username>/disaster-globe-flask/actions/workflows/gh-pages.yml)

A demo project that serves a 3D interactive globe with a galaxy background and sample disaster incidents. Built with **Flask** (Python) for the backend and **Three.js / three-globe** for visualization. Includes CI (tests + lint) and CD (Docker build + push to GHCR) GitHub Actions workflows, plus a static GitHub Pages deploy workflow for publishing the frontend.

---

## What's included

- Flask app that serves static frontend assets from `app/static/`
- REST API endpoint: `GET /api/incidents` (returns GeoJSON)
- Dockerfile and `start.sh` for containerized deployment
- GitHub Actions: `ci.yml`, `cd.yml`, and `gh-pages.yml` (static deploy)
- Tests (pytest) and lint config
- Full frontend (Three.js globe, starfield background)
- Ready-to-deploy: push to GitHub, enable Actions and Pages

---

## Quick start (local)

1. Create a virtualenv and install dependencies:

```bash
python -m venv .venv
source .venv/bin/activate
pip install -r requirements.txt -r requirements-dev.txt
```

2. Run in development mode:

```bash
export FLASK_ENV=development
export FLASK_APP=app
flask run --host=0.0.0.0 --port=5000
# open http://localhost:5000
```

3. Run with Docker:

```bash
docker build -t disaster-globe:local .
docker run --rm -p 8000:8000 -e FLASK_ENV=production disaster-globe:local
# open http://localhost:8000
```

---

## GitHub — CI & CD

### CI
- The `ci.yml` workflow runs on push & PR to `main`: installs dependencies, runs `flake8` and `pytest`.

### CD
- The `cd.yml` workflow builds a Docker image and pushes to **GitHub Container Registry (GHCR)**.
- To auto-deploy to Render, add `RENDER_SERVICE_ID` and `RENDER_API_KEY` to repo secrets; the workflow will trigger a Render deploy.

### GitHub Pages (static)
- `gh-pages.yml` builds a static site by copying `app/static` to the `gh-pages` branch and deploys it via the `peaceiris/actions-gh-pages` Action. This is useful if you prefer hosting only the frontend as a static site on GitHub Pages.

---

## Secrets to configure (Repository Settings → Secrets)
- (Optional) `RENDER_SERVICE_ID`
- (Optional) `RENDER_API_KEY`

---

## Notes & next steps
- Replace placeholder assets in `app/static/assets/textures` with your own satellite imagery or textures.
- For real satellite tile layers consider Mapbox/Planet/Cesium and handle API keys in secrets.
- For production-grade deployments add HTTPS termination, logging, monitoring and scaling.

Enjoy — the full project ZIP is included in this repository download.
