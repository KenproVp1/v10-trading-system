# V10 TRADING SYSTEM - QUICK START GUIDE (2 PHÚT)

## 1️⃣ CHẠY LOCAL (5 PHÚT)

### Terminal 1:
```bash
python -m uvicorn api:app --reload
```

### Terminal 2:
```bash
python -m streamlit run dashboard.py
```

**Open**: http://127.0.0.1:8501 → Done ✅

---

## 2️⃣ PUSH LÊN GITHUB (5 PHÚT)

### Step 1: Tạo repo
- Go to: https://github.com/new
- Name: `v10-trading-system`
- Click "Create"

### Step 2: Get token
- https://github.com/settings/tokens/new
- Generate token
- Copy token (chỉ hiện 1 lần!)

### Step 3: Push
```bash
git config user.name "KenproVp1"
git config user.email "your-email@gmail.com"
git remote add origin https://github.com/KenproVp1/v10-trading-system.git
git branch -M main
git push -u origin main
```

**When asked for password**: PASTE TOKEN (not password)

---

## 3️⃣ DEPLOY LIVE (2 PHÚT) 🚀

### Railway (Recommended):
1. https://railway.app
2. "Create New Project" → "Deploy from GitHub"
3. Select `v10-trading-system`
4. Wait 2 min
5. Get live URL ✅

**Auto-deploys on every push!**

---

## 📱 URLS

| Service | Local | Live |
|---------|-------|------|
| Dashboard | http://127.0.0.1:8501 | https://your-railway-url |
| API | http://127.0.0.1:8000 | https://your-railway-url/api |
| API Docs | http://127.0.0.1:8000/docs | https://your-railway-url/docs |

---

## 🔄 WORKFLOW (After Deploy)

```bash
# Make changes
# ...

# Push (auto-deploys in 2-3 min)
git add .
git commit -m "Update: description"
git push origin main
```

That's it! 🎉
