# PUSH LEN GITHUB - HUONG DAN CHI TIET

## STEP 1: Tao Repository tren GitHub

### 1.1 Mo link nay:
https://github.com/new

### 1.2 Dien thong tin:
- **Repository name**: v10-trading-system
- **Description**: AI-powered trading signals for Vietnamese stocks
- **Public/Private**: Public (de chia se portfolio)
- **Add .gitignore**: No (da co trong project)
- **Add license**: MIT (tuy chon)

### 1.3 Click "Create repository"

---

## STEP 2: Push code tu may tinh

Chon 1 trong 2 cach:

### CACH A: Dung Batch File (Windows - Easiest)
```bash
double-click push_to_github.bat
```
Theo huong dan tren man hinh.

### CACH B: Dung PowerShell/Command Prompt (Manual)

Mo PowerShell va chay cac lenh sau:

```bash
# 1. Set git config
git config user.name "KenproVp1"
git config user.email "your-email@gmail.com"

# 2. Add GitHub as remote
git remote add origin https://github.com/KenproVp1/v10-trading-system.git

# 3. Rename branch to main
git branch -M main

# 4. Push code (first time)
git push -u origin main
```

---

## STEP 3: GitHub Authentication

Khi chay `git push`, GitHub se hoi password/token.

### Option 1: Personal Access Token (Recommended)
1. Go to: https://github.com/settings/tokens/new
2. Token name: `v10-trading-push`
3. Expiration: 90 days
4. Select scopes:
   - [x] repo
   - [x] workflow
5. Click "Generate token"
6. **Copy token immediately** (chi hien 1 lan)
7. Paste token khi GitHub hoi password

### Option 2: SSH Key (Advanced)
```bash
ssh-keygen -t rsa -b 4096
# Follow prompts
# Add public key to GitHub: https://github.com/settings/keys
git remote set-url origin git@github.com:KenproVp1/v10-trading-system.git
git push -u origin main
```

---

## STEP 4: Verify - Check GitHub

1. Go to: https://github.com/KenproVp1/v10-trading-system
2. Ban se thay tat ca files:
   - api.py
   - dashboard.py
   - model.py
   - alert.py
   - requirements.txt
   - Dockerfile
   - docker-compose.yml
   - README.md
   - etc.

---

## STEP 5: Sau khi Push Thanh cong

### Update Code (Lan sau)
```bash
git add .
git commit -m "Update: Description cua changes"
git push origin main
```

### Deploy ngay lap tuc:

#### Railway (Easiest - 2 minutes)
1. Go to: https://railway.app
2. Click "New Project" → "Deploy from GitHub repo"
3. Select: `KenproVp1/v10-trading-system`
4. Click "Deploy"
5. Get live URL in 2 minutes

#### Render
1. Go to: https://render.com
2. Click "New +" → "Web Service"
3. Connect GitHub
4. Select repo
5. Configure start command
6. Deploy

#### Vercel (neu dung Node.js)
1. Go to: https://vercel.com
2. Import GitHub repo
3. Auto-detect
4. Deploy

---

## Troubleshooting

### Loi 1: "fatal: remote origin already exists"
```bash
git remote remove origin
git remote add origin https://github.com/KenproVp1/v10-trading-system.git
git push -u origin main
```

### Loi 2: "Authentication failed"
- Check username: KenproVp1 ✓
- Check repository exists on GitHub
- Use Personal Access Token (khong phai password)

### Loi 3: "Permission denied"
- Repository chua duoc tao
- GitHub token het han
- Kiem tra settings: https://github.com/settings/tokens

### Loi 4: "Branch 'main' set up to track remote"
- Binh thuong! Code da push thanh cong

---

## Success!

Sau khi push thanh cong:
✅ Code tren GitHub
✅ Co the deploy tuc thoi
✅ Share portfolio voi nha tuyen dung
✅ Collaborate voi team

---

## Commands Nhanh (Copy-Paste)

```bash
git config user.name "KenproVp1"
git config user.email "your-email@gmail.com"
git remote add origin https://github.com/KenproVp1/v10-trading-system.git
git branch -M main
git push -u origin main
```

Hoac chay: `push_to_github.bat` (Windows)

---

## Next: Deploy to Production

Sau khi push thanh cong, co the deploy:

1. **Railway** (Recommended - $5-20/month)
   - Auto-deploys on push
   - Best for small projects

2. **Render** (Good - Free tier + $0.007/hour)
   - 750 hours/month free
   - Scale pay-as-you-go

3. **Your VPS** (Best - $5+/month DigitalOcean)
   - Full control
   - Docker: `docker-compose up -d`

---

Questions? Check:
- GitHub Docs: https://docs.github.com
- Git Docs: https://git-scm.com/doc
