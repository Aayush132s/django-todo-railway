# Django Todo App

A simple, production-ready Django todo application that can be deployed to Railway in minutes.

## Features

- ✅ Create, read, update, and delete tasks
- ✅ Mark tasks as complete/incomplete
- ✅ Clean, responsive UI
- ✅ Admin interface
- ✅ Health check endpoint
- ✅ Production-ready settings
- ✅ Docker support
- ✅ Railway deployment ready

## Local Development

### Prerequisites
- Python 3.13+
- Git

### Setup

1. **Clone the repository**
   ```bash
   git clone https://github.com/yourusername/django-todo-railway.git
   cd django-todo-railway
   ```

2. **Create virtual environment**
   ```bash
   python -m venv .venv
   
   # On Windows
   .venv\Scripts\activate
   
   # On macOS/Linux
   source .venv/bin/activate
   ```

3. **Install dependencies**
   ```bash
   pip install -r requirements.txt
   ```

4. **Run migrations**
   ```bash
   python manage.py migrate
   ```

5. **Create superuser (optional)**
   ```bash
   python manage.py createsuperuser
   ```

6. **Start development server**
   ```bash
   python manage.py runserver
   ```

7. **Open in browser**
   - App: http://127.0.0.1:8000/
   - Admin: http://127.0.0.1:8000/admin/
   - Health check: http://127.0.0.1:8000/healthz/

## Docker Development (Optional)

1. **Build the image**
   ```bash
   docker build -t django-todo .
   ```

2. **Run the container**
   ```bash
   docker run -p 8000:8000 --env-file .env.example django-todo
   ```

## Railway Deployment

### Method 1: Deploy from GitHub (Recommended)

1. **Push to GitHub**
   ```bash
   git add .
   git commit -m "Initial commit"
   git branch -M main
   git remote add origin https://github.com/yourusername/django-todo-railway.git
   git push -u origin main
   ```

2. **Deploy on Railway**
   - Go to [Railway](https://railway.app)
   - Click "New Project" → "Deploy from GitHub repo"
   - Select your repository
   - Railway will automatically detect the Django app

3. **Add PostgreSQL Database**
   - In your Railway project, click "New Service" → "PostgreSQL"
   - Railway will automatically provide a `DATABASE_URL` environment variable

4. **Set Environment Variables**
   - Go to your service → Variables tab
   - Add the following variables:
   ```
   DEBUG=False
   SECRET_KEY=your-super-secret-production-key-here
   ALLOWED_HOSTS=your-app-name.up.railway.app
   CSRF_TRUSTED_ORIGINS=https://your-app-name.up.railway.app
   ```
   - `DATABASE_URL` should be automatically set by the PostgreSQL service

5. **Deploy**
   - Railway will automatically build and deploy your app
   - Your app will be available at `https://your-app-name.up.railway.app`

### Method 2: Railway CLI (Alternative)

If you have the Railway CLI installed:

```bash
railway login
railway init
railway add postgresql
railway deploy
```

## Environment Variables

| Variable | Description | Default | Required |
|----------|-------------|---------|----------|
| `DEBUG` | Enable Django debug mode | `True` | No |
| `SECRET_KEY` | Django secret key | Generated | Yes (production) |
| `ALLOWED_HOSTS` | Comma-separated list of allowed hosts | `localhost,127.0.0.1` | Yes (production) |
| `CSRF_TRUSTED_ORIGINS` | Comma-separated list of trusted origins | `` | Yes (production) |
| `DATABASE_URL` | PostgreSQL connection string | SQLite (local) | Yes (production) |

## API Endpoints

- `GET /` - Task list and add form
- `POST /add/` - Create new task
- `GET /toggle/<id>/` - Toggle task completion
- `GET /delete/<id>/` - Delete task
- `GET /healthz/` - Health check endpoint
- `GET /admin/` - Django admin interface

## Technology Stack

- **Backend**: Django 5.1
- **Database**: SQLite (development), PostgreSQL (production)
- **Web Server**: Gunicorn
- **Static Files**: Whitenoise
- **Containerization**: Docker
- **Deployment**: Railway

## Production Considerations

- Environment-based configuration
- Static file handling with Whitenoise
- PostgreSQL database with connection pooling
- CSRF protection
- Security middleware
- Compressed static files
- Health check endpoint for monitoring

## Contributing

1. Fork the repository
2. Create a feature branch
3. Make your changes
4. Add tests if applicable
5. Submit a pull request

## License

MIT License - feel free to use this project for learning or as a starting point for your own applications.