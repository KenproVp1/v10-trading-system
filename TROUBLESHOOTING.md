# TROUBLESHOOTING - SỰ CỐ THƯỜNG GẶP & CÁCH SỬA

## ❌ PYTHON / GIT ISSUES

### "Python is not recognized"
```
Error: 'python' is not recognized as an internal or external command
```

**Cách 1: Dùng python3**
```bash
python3 --version
python3 -m pip install -r requirements.txt
python3 -m uvicorn api:app --reload
```

**Cách 2: Cài lại Python**
- Download: https://www.python.org/downloads/
- **TICK**: "Add Python to PATH"
- Click Install
- Restart PowerShell
- Test: `python --version`

**Cách 3: Full path**
```bash
C:\Users\Pc\AppData\Local\Programs\Python\Python311\python.exe -m pip install -r requirements.txt
```

---

### "Git is not recognized"
```
Error: 'git' is not recognized as an internal or external command
```

**Fix**: Download Git từ https://git-scm.com/download/win

---

## ❌ PORT ISSUES

### "Address already in use"
```
OSError: [WinError 10048] Only one usage of each socket address...
Port 8000 already in use
```

**Fix 1: Kill process**
```bash
# Windows
netstat -ano | findstr :8000
taskkill /PID [PID] /F

# Mac/Linux
lsof -i :8000
kill -9 [PID]
```

**Fix 2: Change port**
```bash
# API on 8001
python -m uvicorn api:app --port 8001

# Dashboard on 8502
streamlit run dashboard.py --server.port 8502
```

**Fix 3: Wait & Retry**
```bash
# Ports nhỏ (8000-8100) có thể cần chờ
# Chờ 30 giây, restart PowerShell, thử lại
```

---

## ❌ API / DASHBOARD ISSUES

### Dashboard shows "ERR_CONNECTION_REFUSED"
```
Rất tiếc... không thể truy cập trang này
127.0.0.1 từ chối kết nối
```

**Cách 1**: API chưa chạy
- Kiểm tra Terminal 1 có dòng "Uvicorn running on..." không
- Nếu không: Chạy `python -m uvicorn api:app --reload`

**Cách 2**: API bị crash
- Xem Terminal 1 có error không
- Restart API

**Cách 3**: Firewall block
- Windows Firewall Settings → Allow through firewall
- Hoặc disable tạm

---

### "ModuleNotFoundError: No module named 'fastapi'"
```
ModuleNotFoundError: No module named 'fastapi'
```

**Fix**:
```bash
# Cài lại requirements
pip install -r requirements.txt

# Hoặc cài từng cái
pip install fastapi uvicorn streamlit
```

---

### Dashboard stuck on "Connecting to server"
```
Connecting to server...
```

**Fix**:
1. Refresh page (Ctrl+R / Cmd+R)
2. Clear cache: Ctrl+Shift+Delete
3. Restart Dashboard: Ctrl+C, chạy lại
4. Restart API nếu vẫn không được

---

## ❌ GIT / GITHUB ISSUES

### "Fatal: remote origin already exists"
```
fatal: remote origin already exists.
```

**Fix**:
```bash
# Xóa remote cũ
git remote remove origin

# Add lại
git remote add origin https://github.com/KenproVp1/v10-trading-system.git
git push -u origin main
```

---

### "Authentication failed for GitHub"
```
fatal: Authentication failed for 'https://github.com/...'
```

**Fix 1**: Dùng Personal Access Token (không password)
- https://github.com/settings/tokens/new
- Generate token
- Copy & paste khi GitHub hỏi

**Fix 2**: Clear cached credentials
```bash
# Windows
credential remove https://github.com

# Mac
security delete-generic-password -a KenproVp1 -s github.com

# Linux
~/.git-credentials
```

**Fix 3**: SSH key (advanced)
```bash
ssh-keygen -t rsa -b 4096
# Add public key to: https://github.com/settings/keys
git remote set-url origin git@github.com:KenproVp1/v10-trading-system.git
git push -u origin main
```

---

### "Permission denied (publickey)"
```
Permission denied (publickey).
fatal: Could not read from remote repository.
```

**Fix**: Dùng HTTPS thay vì SSH
```bash
git remote set-url origin https://github.com/KenproVp1/v10-trading-system.git
git push origin main
```

---

### "Can't find repository"
```
fatal: repository 'https://github.com/KenproVp1/v10-trading-system.git' not found
```

**Fix**: Repository chưa được tạo
1. Go to: https://github.com/new
2. Create repository: `v10-trading-system`
3. Thử lại

---

## ❌ DEPLOYMENT ISSUES

### Railway: Build failed
**Check logs**: https://railway.app → Project → Logs

Common fixes:
```bash
# 1. Dockerfile có lỗi
# → Fix Dockerfile

# 2. Requirements missing
# → Check requirements.txt có tất cả packages không

# 3. Port issue
# → Change port in start command: --server.port 10000

# 4. Rebuild
# → Click "Redeploy"
```

---

### Railway: "Application failed to start"
```
ERROR: Application failed to start
```

**Fix**:
1. Xem logs xem lỗi chính xác
2. Restart container: https://railway.app → Project → Redeploy
3. Check start command syntax

---

### Railway: "502 Bad Gateway"
```
Error 502: Bad Gateway
The server is temporarily unable to service your request
```

**Nguyên nhân**: API crash hoặc port sai

**Fix**:
```bash
# Start command sai?
# Đúng:
python -m streamlit run dashboard.py --server.port 10000 --server.address 0.0.0.0

# Sai:
streamlit run dashboard.py
```

Restart: https://railway.app → Redeploy

---

## ❌ DEPENDENCIES ISSUES

### Pip install frozen / stuck
```
Collecting fastapi...
# Nó bị dừng lâu
```

**Fix**:
```bash
# Timeout tăng
pip install --default-timeout=1000 -r requirements.txt

# Hoặc dùng mirror
pip install -i https://mirrors.aliyun.com/pypi/simple/ -r requirements.txt
```

---

### Conflicting versions
```
ERROR: pip's dependency resolver does not currently take into account all the packages that are installed
```

**Fix**:
```bash
# Upgrade pip
python -m pip install --upgrade pip

# Xóa venv cũ & recreate
# Windows
rmdir venv /s /q
python -m venv venv
venv\Scripts\activate
pip install -r requirements.txt
```

---

## ✅ DEBUG CHECKLIST

Khi bị sự cố, check theo thứ tự:

- [ ] Python installed? `python --version`
- [ ] Git installed? `git --version`
- [ ] In right folder? `ls` (thấy api.py, dashboard.py?)
- [ ] Dependencies installed? `pip list | grep fastapi`
- [ ] API running? Terminal 1 có "Uvicorn running"?
- [ ] Dashboard running? Terminal 2 có "Local URL"?
- [ ] Port 8000 free? `netstat -ano | findstr :8000`
- [ ] Firewall block? Try localhost
- [ ] GitHub account created? https://github.com/login
- [ ] Repository created? https://github.com/KenproVp1/v10-trading-system
- [ ] Token valid? https://github.com/settings/tokens
- [ ] Remote added? `git remote -v`

---

## 📞 NEED HELP?

1. **Copy error message** (exact text)
2. **Check** relevant section trên (có match không?)
3. **Try fixes** theo thứ tự
4. **If still stuck**:
   - GitHub Issues: https://github.com/KenproVp1/v10-trading-system/issues
   - Railway Support: https://railway.app/support
   - Stack Overflow: Tag your issue with `fastapi` + `streamlit`

**Most common**: Kill port process hoặc restart terminals! 🔧
