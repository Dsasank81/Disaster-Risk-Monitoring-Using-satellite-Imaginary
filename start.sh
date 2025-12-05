#!/usr/bin/env bash
export FLASK_APP=app
if [ "$FLASK_ENV" = "development" ]; then
  flask run --host=0.0.0.0 --port=${PORT:-5000}
else
  exec gunicorn "app:create_app()" -b 0.0.0.0:${PORT:-8000} --workers 3 --threads 4
fi
