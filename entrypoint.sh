#!/bin/bash
set -e

# Function to wait for database (if needed)
wait_for_db() {
    if [ -n "$DATABASE_URL" ]; then
        echo "Waiting for database..."
        # You can add actual database connection check here
        sleep 2
    fi
}

# Run database migrations
echo "Running database migrations..."
python manage.py migrate --noinput

# Collect static files
echo "Collecting static files..."
python manage.py collectstatic --noinput --clear

# Get the port from environment variable or use default
PORT=${PORT:-8000}
echo "Starting application on port: $PORT"

# Start Gunicorn with the actual port number
exec gunicorn config.wsgi:application \
    --bind 0.0.0.0:$PORT \
    --workers 2 \
    --access-logfile -