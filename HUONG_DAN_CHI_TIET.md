# V10 TRADING SYSTEM - HƯỚNG DẪN CHI TIẾT CHO NGƯỜI MỚI

## MỤC LỤC
1. [Chuẩn bị](#chuẩn-bị)
2. [Cài đặt cục bộ](#cài-đặt-cục-bộ)
3. [Push lên GitHub](#push-lên-github)
4. [Deploy lên Production](#deploy-lên-production)
5. [Troubleshooting](#troubleshooting)

---

## CHUẨN BỊ

### Bước 1: Kiểm tra Python
Mở **PowerShell** (Windows) hoặc **Terminal** (Mac/Linux) và gõ:

```bash
python --version
```

**Kết quả mong đợi**: `Python 3.8` hoặc cao hơn

Nếu lỗi "python is not recognized":
- Tải từ: https://www.python.org/downloads/
- **QUAN TRỌNG**: Tick vào "Add Python to PATH" khi cài

### Bước 2: Kiểm tra Git
```bash
git --version
```

**Kết quả mong đợi**: `git version 2.x.x`

Nếu lỗi: Tải từ https://git-scm.com/download/win

### Bước 3: Tạo GitHub Account
1. Go to: https://github.com/signup
2. Nhập email → Click "Create account"
3. Chọn free plan
4. Verify email (check inbox)
5. Done!

---

## CÀI ĐẶT CỤC BỘ

### Bước 1: Cài đặt Dependencies

Mở PowerShell ở folder chứa project (V10_profit_system_full) và gõ:

```bash
pip install -r requirements.txt
```

**Chờ 2-3 phút** cho nó cài xong. Bạn sẽ thấy:
```
Successfully installed fastapi-0.136.3 uvicorn-0.49.0 streamlit-1.58.0 ...
```

### Bước 2: Chạy API

**Mở PowerShell 1** ở folder project:

```bash
python -m uvicorn api:app --reload
```

**Kết quả mong đợi:**
```
INFO:     Uvicorn running on http://127.0.0.1:8000
INFO:     Application startup complete
```

**LƯU Ý**: Không đóng cửa sổ này! Giữ nó chạy.

### Bước 3: Chạy Dashboard

**Mở PowerShell 2 (cửa sổ mới)** ở folder project:

```bash
python -m streamlit run dashboard.py
```

**Kết quả mong đợi:**
```
You can now view your Streamlit app in your browser.
Local URL: http://localhost:8501
```

Trình duyệt sẽ **tự động mở**. Nếu không, copy link vào browser.

### Bước 4: Test thử

**Dashboard mở ở**: http://127.0.0.1:8501

1. Nhập symbol: `FPT` (hoặc `VNM`)
2. Click "🔍 Analyze"
3. Thấy kết quả (Score, Signal) → Thành công! ✅

**API Test:**
- Health check: http://127.0.0.1:8000/health
- API Docs: http://127.0.0.1:8000/docs
- Analyze: http://127.0.0.1:8000/analyze/FPT

---

## PUSH LÊN GITHUB

### Bước 1: Tạo Repository trên GitHub

1. **Đăng nhập GitHub**: https://github.com/login
   - Username: `KenproVp1`
   - Password: [Nhập password của bạn]

2. Go to: https://github.com/new

3. Điền thông tin:
   - **Repository name**: `v10-trading-system`
   - **Description**: `AI-powered trading signals for Vietnamese stocks`
   - **Public** (để mọi người có thể xem)
   - Bỏ qua ".gitignore" (đã có trong project)
   
4. Click **Create repository**

### Bước 2: Lấy Personal Access Token

**Tại sao?** Bạn cần token để xác thực thay vì mật khẩu.

1. Go to: https://github.com/settings/tokens/new
2. **Token name**: `v10-trading-push`
3. **Expiration**: 90 days
4. **Scopes**: Tick vào:
   - ✅ `repo` (full control)
   - ✅ `workflow` (for CI/CD)
5. Click **Generate token**
6. **SAO CHÉP TOKEN NGAY** (nó chỉ hiện 1 lần!)
   - Dán vào Notepad tạm thời

### Bước 3: Push Code

**Mở PowerShell** ở folder project (KHÔNG chạy API/Dashboard) và gõ:

```bash
# Set user config
git config user.name "KenproVp1"
git config user.email "your-email@gmail.com"

# Add GitHub
git remote add origin https://github.com/KenproVp1/v10-trading-system.git

# Rename branch
git branch -M main

# Push to GitHub (lần đầu)
git push -u origin main
```

**Khi nó hỏi:**
```
Username for 'https://github.com': KenproVp1
Password for 'https://KenproVp1@github.com': [PASTE TOKEN HERE - không phải password]
```

**Kết quả mong đợi:**
```
Counting objects: 20, done.
Delta compression using up to 8 threads.
Compressing objects: 100% (18/18), done.
Writing objects: 100% (20/20), 15.23 KiB | 3.05 MiB/s, done.
Total 20 (delta 4), reused 0 (delta 0), pack-reused 0
To https://github.com/KenproVp1/v10-trading-system.git
 * [new branch]      main -> main
Branch 'main' set up to track remote branch 'main' from 'origin'.
```

**Verify**: Go to https://github.com/KenproVp1/v10-trading-system
- Thấy tất cả files (api.py, dashboard.py, etc.) → Thành công! ✅

---

## DEPLOY LÊN PRODUCTION

### CÁCH 1: RAILWAY (EASIEST - RECOMMENDED) ⭐

**Thời gian**: 5 phút
**Chi phí**: $5-20/tháng (free trial $5 credits)

#### Bước 1: Connect GitHub to Railway

1. Go to: https://railway.app
2. Click **"Create New Project"** (nếu chưa có account, sign up)
3. Click **"Deploy from GitHub repo"**
4. Click **"Configure GitHub App"**
5. Chọn repository: `v10-trading-system`
6. Click **Install**

#### Bước 2: Configure Services

Railway sẽ tự phát hiện `requirements.txt` và `Dockerfile`.

**Config cho Streamlit:**
- **Start Command**: 
  ```
  python -m streamlit run dashboard.py --server.port 10000 --server.address 0.0.0.0
  ```

#### Bước 3: Deploy & Get URL

1. Click **Deploy**
2. Chờ 2-3 phút
3. Sau khi deploy thành công, bạn sẽ có URL:
   ```
   https://v10-trading-system-production.up.railway.app
   ```

**Verify**: Click vào link → Thấy dashboard ✅

#### Bước 4: Cập nhật code (lần sau)

Chỉ cần:
```bash
git add .
git commit -m "Update: [mô tả thay đổi]"
git push origin main
```

Railway **tự động deploy** (2-3 phút)! 🚀

---

### CÁCH 2: RENDER (ALTERNATIVE)

**Thời gian**: 10 phút
**Chi phí**: Free tier 750 hours/month + $0.007/hour

1. Go to: https://render.com
2. Sign up / Login
3. Click **"New +"** → **"Web Service"**
4. **Connect GitHub** → Select `v10-trading-system`
5. **Configure**:
   - Name: `v10-trading-system`
   - Runtime: `Python 3.11`
   - Build Command: `pip install -r requirements.txt`
   - Start Command: 
     ```
     python -m streamlit run dashboard.py --server.port 10000 --server.address 0.0.0.0
     ```
6. Click **Create Web Service**
7. Chờ deploy (5-10 phút)
8. Get URL từ dashboard

---

### CÁCH 3: VPS (CONTROL TUYỆT ĐỐI)

**Thời gian**: 30 phút
**Chi phí**: $5-10/tháng (DigitalOcean, Linode)
**Lợi ích**: Full control, tốc độ cao

#### Bước 1: Tạo VPS

1. Go to: https://www.digitalocean.com
2. Create Droplet:
   - OS: Ubuntu 22.04
   - Size: $5/month
3. SSH vào server

#### Bước 2: Setup Server

```bash
# Update system
sudo apt update && sudo apt upgrade -y

# Install Docker
curl -fsSL https://get.docker.com -o get-docker.sh
sudo sh get-docker.sh

# Clone repo
git clone https://github.com/KenproVp1/v10-trading-system.git
cd v10-trading-system

# Run with Docker
docker-compose up -d
```

#### Bước 3: Access

- API: `http://your-server-ip:8000`
- Dashboard: `http://your-server-ip:8501`

#### Bước 4: Setup Custom Domain (Optional)

Thêm vào DNS:
```
A Record: your-domain.com → your-server-ip
```

---

## TROUBLESHOOTING

### Lỗi 1: "python is not recognized"
**Nguyên nhân**: Python không trong PATH
**Cách sửa**:
```bash
# Cài lại Python với "Add Python to PATH"
# Hoặc dùng full path:
C:\Users\[username]\AppData\Local\Programs\Python\Python311\python.exe -m pip install -r requirements.txt
```

### Lỗi 2: "Port 8000/8501 already in use"
**Nguyên nhân**: Port đang bị dùng
**Cách sửa** (Option A - Kill process):
```bash
# Windows
netstat -ano | findstr :8000
taskkill /PID [PID] /F

# Mac/Linux
lsof -i :8000
kill -9 [PID]
```

**Option B - Đổi port**:
```bash
# API
python -m uvicorn api:app --port 8001

# Dashboard
streamlit run dashboard.py --server.port 8502
```

### Lỗi 3: "Cannot connect to API from dashboard"
**Nguyên nhân**: API không chạy
**Cách sửa**:
1. Kiểm tra PowerShell thứ 1 có chạy API không
2. Test: http://127.0.0.1:8000/health
3. Nếu không, restart API

### Lỗi 4: Git push failed - "authentication failed"
**Nguyên nhân**: Token hết hạn hoặc sai
**Cách sửa**:
```bash
# Tạo token mới: https://github.com/settings/tokens/new
# Copy token
git push origin main
# Paste token khi hỏi
```

### Lỗi 5: "requirements.txt not found"
**Nguyên nhân**: Chạy từ folder sai
**Cách sửa**:
```bash
# Chắc chắn bạn ở đúng folder
cd C:\Users\Pc\Downloads\V10_profit_system_full
pip install -r requirements.txt
```

### Lỗi 6: Deploy failed trên Railway/Render
**Nguyên nhân**: Dockerfile hoặc config sai
**Cách sửa**:
1. Xem logs: https://railway.app/project/[id]/logs
2. Kiểm tra `Dockerfile` có đúng không
3. Rebuild: Click "Redeploy"

---

## QUICK REFERENCE

### Chạy local (Development)
```bash
# Terminal 1
python -m uvicorn api:app --reload

# Terminal 2
python -m streamlit run dashboard.py
```

### Push lên GitHub
```bash
git add .
git commit -m "Update: description"
git push origin main
```

### Deploy lên Railway
- Tự động deploy sau mỗi push

### Kiểm tra trạng thái
```bash
# Git status
git status
git log --oneline -5

# Check API
curl http://127.0.0.1:8000/health
```

---

## NEXT STEPS

✅ Cài đặt cục bộ
✅ Push lên GitHub
✅ Deploy lên Railway/Render

**Bây giờ bạn có thể:**

1. **Update code** → Push → Auto-deploy
2. **Share link** với team/investors
3. **Monitor logs** trên Railway/Render
4. **Scale up** nếu cần
5. **Add authentication** cho security
6. **Integrate real ML model** thay vì random predictions

---

## SUPPORT

- **GitHub**: https://github.com/KenproVp1/v10-trading-system/issues
- **Railway Docs**: https://docs.railway.app
- **Git Help**: https://git-scm.com/doc
- **Python Docs**: https://docs.python.org

**Bạn đã sẵn sàng! Lên production thôi!** 🚀
