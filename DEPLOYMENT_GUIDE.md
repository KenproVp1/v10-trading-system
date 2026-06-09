# V10 Trading Profit System - GitHub & Deployment Guide

## Step 1: Initialize Git & Push to GitHub

### 1.1 Create GitHub Repository
1. Go to https://github.com/new
2. Create repo name: `v10-trading-system`
3. Choose: Public (for portfolio) or Private
4. Click "Create repository"

### 1.2 Push Code to GitHub (Windows)

Open PowerShell or Git Bash in your project folder and run:

```bash
# Initialize git
git init

# Add all files
git add .

# Create initial commit
git commit -m "Initial commit: V10 Trading Profit System"

# Add remote (replace USERNAME with your GitHub username)
git remote add origin https://github.com/USERNAME/v10-trading-system.git

# Rename branch to main if needed
git branch -M main

# Push to GitHub
git push -u origin main
```

## Step 2: Deploy to Production (Choose One)

### Option A: Deploy on Railway.app (Easiest - Vietnamese Friendly)

1. Go to https://railway.app
2. Click "New Project" → "Deploy from GitHub repo"
3. Select your `v10-trading-system` repo
4. Railway auto-detects and deploys
5. Get your live URL instantly

**Pro**: Auto-deploys on every GitHub push, free tier available

### Option B: Deploy on Render.com

1. Go to https://render.com
2. Click "New +" → "Web Service"
3. Select "Build and deploy from a Git repository"
4. Connect GitHub account
5. Select your repo

Configure:
- **Name**: v10-trading-system
- **Build Command**: `pip install -r requirements.txt`
- **Start Command**: `python -m streamlit run dashboard.py --server.port 10000 --server.address 0.0.0.0`
- **Instance Type**: Free tier (first 750 hours/month free)

Click Deploy. Done!

### Option C: Deploy on Heroku (Legacy but Stable)

```bash
# Install Heroku CLI
# Go to https://devcenter.heroku.com/articles/heroku-cli

# Login to Heroku
heroku login

# Create app
heroku create v10-trading-system

# Push code
git push heroku main

# View logs
heroku logs --tail

# Open app
heroku open
```

### Option D: Deploy on Own VPS/Server (Full Control)

**Prerequisites**: Linux server, Docker installed

1. Clone repository on server:
```bash
git clone https://github.com/USERNAME/v10-trading-system.git
cd v10-trading-system
```

2. Deploy with Docker:
```bash
docker-compose up -d
```

3. Access:
- API: http://your-server-ip:8000
- Dashboard: http://your-server-ip:8501

## Step 3: Set Up Custom Domain (Optional)

### For Railway/Render:
- Dashboard settings → Custom domain
- Add your domain (e.g., trading.yourdomain.com)
- Point DNS to their nameservers

### For VPS:
- Use Nginx or Apache as reverse proxy
- Install SSL with Let's Encrypt
- Point domain DNS to your server IP

## Step 4: Environment Variables (Production)

Create `.env` file for secrets:
```
API_HOST=0.0.0.0
API_PORT=8000
DASHBOARD_PORT=8501
DEBUG=False
```

Add to docker-compose.yml:
```yaml
env_file: .env
```

## Monitoring & Updates

### View Logs
- Railway: Dashboard → Logs tab
- Render: Dashboard → Logs tab
- Local: `docker-compose logs -f`

### Update Code
```bash
git add .
git commit -m "Update: [description]"
git push origin main
```

Auto-deploys on Railway/Render!

## Troubleshooting

**Port conflict on VPS?**
```bash
docker-compose down
# Edit docker-compose.yml ports
docker-compose up -d
```

**Out of memory?**
```bash
docker-compose restart
docker system prune  # Clean up unused containers
```

**Can't connect to API from dashboard?**
- Check if API container is running: `docker-compose ps`
- Check logs: `docker-compose logs api`
- Verify CORS is enabled in api.py

## Next Steps

1. ✅ Push to GitHub
2. ✅ Deploy to Railway/Render
3. Get your live URL
4. Share with team
5. Monitor logs
6. Update ML model with real data
7. Add user authentication

## Cost Breakdown

| Platform | Free Tier | Notes |
|----------|-----------|-------|
| Railway | 500 credits/month | Perfect for testing |
| Render | 750 hours/month | Great for small projects |
| Heroku | ❌ Paid only | $7/month minimum |
| VPS | $5-10/month | Full control, best for production |

**Recommended**: Start with Railway for development, scale to VPS for production.

## Questions?

- Railway docs: https://docs.railway.app
- Render docs: https://render.com/docs
- Docker docs: https://docs.docker.com
