#!/bin/sh

# Exit on any failure
set -e

echo "Running database migrations..."
python manage.py migrate --noinput

echo "Collecting static files..."
python manage.py collectstatic --noinput --clear

echo "Starting application..."
# If no command provided, start gunicorn bound to the PORT env var (defaults to 8000)
if [ "$#" -eq 0 ]; then
	PORT=${PORT:-8000}
	echo "No CMD provided — starting gunicorn on 0.0.0.0:${PORT}"
	exec gunicorn config.wsgi:application --bind "0.0.0.0:${PORT}" --workers 2 --worker-class sync --max-requests 1000 --max-requests-jitter 100 --preload
else
	echo "Executing provided command: $@"
	exec "$@"
fi