# PUSH LÊN GITHUB - MANUAL STEPS

Vì GitHub push cần interactive authentication, hãy làm theo các bước sau:

## BƯỚC 1: Mở PowerShell

1. Mở PowerShell ở folder project: `C:\Users\Pc\Downloads\V10_profit_system_full`
2. Hoặc Shift+Right Click → "Open PowerShell here"

## BƯỚC 2: Chạy Push Command

Copy-paste lệnh này vào PowerShell:

```bash
git push -u origin main
```

## BƯỚC 3: Nhập Credentials

### GitHub sẽ hỏi:
```
Username for 'https://github.com': 
```

**Trả lời**: `KenproVp1` (rồi nhấn Enter)

### Tiếp theo hỏi:
```
Password for 'https://KenproVp1@github.com':
```

**QUAN TRỌNG**: 
- **KHÔNG** gõ password của GitHub
- **PASTE** Personal Access Token
- Nhấn Ctrl+V để paste
- Sau đó nhấn Enter

## BƯỚC 4: Chờ Push Hoàn Thành

Bạn sẽ thấy:
```
Counting objects: 28, done.
Delta compression using up to 8 threads.
Compressing objects: 100% (25/25), done.
Writing objects: 100% (28/28), 26.18 KiB | 5.23 MiB/s, done.
Total 28 (delta 6), reused 0 (delta 0), pack-reused 0
remote: Resolving deltas: 100% (6/6), done.
To https://github.com/KenproVp1/v10-trading-system.git
 * [new branch]      main -> main
Branch 'main' set up to track remote branch 'main' from 'origin'.
```

## BƯỚC 5: Verify trên GitHub

Mở link: https://github.com/KenproVp1/v10-trading-system

Bạn sẽ thấy tất cả files:
- api.py ✓
- dashboard.py ✓
- model.py ✓
- alert.py ✓
- requirements.txt ✓
- Dockerfile ✓
- docker-compose.yml ✓
- README.md ✓
- HUONG_DAN_CHI_TIET.md ✓
- Và 18 files khác ✓

## ✅ SUCCESS!

Code của bạn đã trên GitHub!

### NEXT: Deploy to Railway (2 phút)

1. Go to: https://railway.app
2. Click "Create New Project"
3. Click "Deploy from GitHub repo"
4. Authorize GitHub
5. Select repository: `v10-trading-system`
6. Click "Deploy"
7. Chờ 2-3 phút
8. Get live URL ✅

## 💡 Pro Tips

- Token không hiển thị khi gõ (bình thường)
- Nếu lỗi: Kiểm tra token còn hạn không
- Nếu repo not found: Tạo repo trước: https://github.com/new

---

**Ready? Làm ngay bước 1-2!**
