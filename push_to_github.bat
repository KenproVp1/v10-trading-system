@echo off
REM V10 Trading - Push to GitHub (Windows)

setlocal enabledelayedexpansion

set GITHUB_USERNAME=KenproVp1
set REPO_NAME=v10-trading-system

echo =========================================
echo V10 Trading System - GitHub Push
echo =========================================
echo.
echo BUOC 1: Tao repository tren GitHub
echo.
echo Mo link nay trong browser:
echo https://github.com/new
echo.
echo Dien thong tin:
echo - Repository name: %REPO_NAME%
echo - Description: AI-powered trading signals for Vietnamese stocks
echo - Public (kho cong)
echo.
echo Sau do click "Create repository"
echo.
pause

echo.
echo BUOC 2: Dang nhap vao GitHub...
echo.
echo Neu GitHub request password, dung Personal Access Token:
echo 1. Go to: https://github.com/settings/tokens
echo 2. Click "Generate new token (classic)"
echo 3. Check: repo, workflow
echo 4. Copy token
echo 5. Paste token khi GitHub hoi password
echo.
pause

echo.
echo BUOC 3: Pushing code to GitHub...
echo.

REM Set git credentials
git config user.name "%GITHUB_USERNAME%"

REM Add remote
git remote add origin https://github.com/%GITHUB_USERNAME%/%REPO_NAME%.git

REM Rename branch
git branch -M main

REM Push to GitHub
git push -u origin main

if errorlevel 1 (
    echo.
    echo ERROR: Push that bai!
    echo.
    echo Khac phuc:
    echo 1. Kiem tra GitHub username: %GITHUB_USERNAME%
    echo 2. Kiem tra Repository da duoc tao: https://github.com/%GITHUB_USERNAME%/%REPO_NAME%
    echo 3. Kiem tra authentication
    echo.
) else (
    echo.
    echo =========================================
    echo SUCCESS! Push hoan tat!
    echo =========================================
    echo.
    echo Repo URL: https://github.com/%GITHUB_USERNAME%/%REPO_NAME%
    echo.
)

pause
