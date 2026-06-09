# CHEATSHEET - COPY-PASTE COMMANDS

## 🔧 SETUP (First Time)

```bash
# 1. Cài dependencies
pip install -r requirements.txt

# 2. Run API (Terminal 1)
python -m uvicorn api:app --reload

# 3. Run Dashboard (Terminal 2)
python -m streamlit run dashboard.py
```

**Open**: http://127.0.0.1:8501

---

## 🚀 GITHUB PUSH (First Time)

```bash
# 1. Setup git
git config user.name "KenproVp1"
git config user.email "your-email@gmail.com"

# 2. Add remote
git remote add origin https://github.com/KenproVp1/v10-trading-system.git

# 3. Rename branch
git branch -M main

# 4. Push (paste token when asked for password)
git push -u origin main
```

**URL**: https://github.com/KenproVp1/v10-trading-system

---

## 📤 UPDATE CODE (After Changes)

```bash
git add .
git commit -m "Update: Your message here"
git push origin main
```

---

## 🌐 RAILWAY DEPLOY

```bash
# No commands needed!
# Just:
# 1. Go to: https://railway.app
# 2. New Project → Deploy from GitHub
# 3. Select v10-trading-system
# 4. Wait 2 min
# 5. Get live URL

# Auto-deploys on every push!
```

---

## 🐛 TROUBLESHOOTING

```bash
# Check git status
git status

# View recent commits
git log --oneline -5

# Check API health
curl http://127.0.0.1:8000/health

# Kill port process (Windows)
netstat -ano | findstr :8000
taskkill /PID [PID] /F

# Kill port process (Mac/Linux)
lsof -i :8000
kill -9 [PID]

# Change port
python -m uvicorn api:app --port 8001
streamlit run dashboard.py --server.port 8502

# Clear git credentials (if auth fails)
git credential reject https://github.com
```

---

## 📍 URLS

| What | URL |
|------|-----|
| Local Dashboard | http://127.0.0.1:8501 |
| Local API | http://127.0.0.1:8000 |
| API Docs | http://127.0.0.1:8000/docs |
| API Health | http://127.0.0.1:8000/health |
| GitHub Repo | https://github.com/KenproVp1/v10-trading-system |
| GitHub Token | https://github.com/settings/tokens/new |
| Railway | https://railway.app |

---

## 📋 CHECKLIST

Before push:
- [ ] Code tested locally ✅
- [ ] No errors in Terminal 1 & 2
- [ ] Dashboard shows correct data
- [ ] API responds: http://127.0.0.1:8000/health

Before GitHub push:
- [ ] `git status` shows all changes
- [ ] Commit message is clear
- [ ] No sensitive data (tokens, passwords)

After GitHub push:
- [ ] Visit: https://github.com/KenproVp1/v10-trading-system
- [ ] See all files ✅
- [ ] Green checkmark on commit ✅

After Railway deploy:
- [ ] Railway shows "Deploy successful"
- [ ] Click deploy link
- [ ] Dashboard loads ✅
- [ ] Can analyze stocks ✅

---

## 🆘 COMMON ERRORS & FIXES

| Error | Fix |
|-------|-----|
| `python not found` | `python3 --version` or reinstall |
| `pip not found` | `python -m pip --version` |
| `port already in use` | `taskkill /PID [PID] /F` or change port |
| `module not found` | `pip install -r requirements.txt` |
| `Cannot connect to API` | Check Terminal 1 is running |
| `Git auth failed` | Use Personal Access Token (not password) |
| `Remote already exists` | `git remote remove origin` then add again |

---

## ⚡ POWER MOVES

```bash
# Undo last commit (haven't pushed yet)
git reset HEAD~1

# Undo last push
git push --force-with-lease origin HEAD~1:main

# View file on GitHub
git remote -v  # Copy origin URL
# Add /blob/main/filename to URL

# SSH instead of HTTPS
git remote set-url origin git@github.com:KenproVp1/v10-trading-system.git

# Multiple remotes (heroku + github)
git remote add heroku https://git.heroku.com/your-app.git
git push heroku main

# Squash commits before push
git rebase -i HEAD~3  # Squash last 3 commits
```

---

## 🎯 QUICK FLOWS

### Flow 1: Development Loop
```bash
# Make changes
# ...

# Test locally (run both terminals)
python -m uvicorn api:app --reload  # Terminal 1
python -m streamlit run dashboard.py  # Terminal 2

# Push to GitHub
git add .
git commit -m "feature: add X"
git push origin main

# Railway auto-deploys! ✅
```

### Flow 2: Fix Bug on Production
```bash
# Pull latest (if working on multiple devices)
git pull origin main

# Make fix
# ...

# Test locally
# ...

# Push fix
git add .
git commit -m "fix: bug description"
git push origin main

# Railway redeploys! ✅
```

### Flow 3: Rollback to Previous Version
```bash
# View commits
git log --oneline -10

# Revert to specific commit
git revert [commit-hash]
git push origin main

# Or force push to previous
git reset --hard [commit-hash]
git push --force-with-lease origin main
```

---

## 📚 DOCS LINKS

- Python: https://docs.python.org
- FastAPI: https://fastapi.tiangolo.com
- Streamlit: https://docs.streamlit.io
- Git: https://git-scm.com/doc
- GitHub: https://docs.github.com
- Railway: https://docs.railway.app
- Docker: https://docs.docker.com

---

**Print this page for quick reference!** 🖨️
