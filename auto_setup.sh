#!/bin/bash
# V10 Trading - Complete Setup & Deployment Script
# Run this script to automate the entire process

set -e

echo "======================================"
echo "V10 TRADING SYSTEM - AUTOMATED SETUP"
echo "======================================"
echo ""

# Color output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# 1. Check Python
echo -e "${YELLOW}Checking Python...${NC}"
if ! command -v python &> /dev/null; then
    echo -e "${RED}Python not found! Install from https://www.python.org/downloads/${NC}"
    exit 1
fi
PYTHON_VERSION=$(python --version)
echo -e "${GREEN}✓ Python: $PYTHON_VERSION${NC}"

# 2. Check Git
echo ""
echo -e "${YELLOW}Checking Git...${NC}"
if ! command -v git &> /dev/null; then
    echo -e "${RED}Git not found! Install from https://git-scm.com/download${NC}"
    exit 1
fi
GIT_VERSION=$(git --version)
echo -e "${GREEN}✓ Git: $GIT_VERSION${NC}"

# 3. Install dependencies
echo ""
echo -e "${YELLOW}Installing dependencies...${NC}"
pip install -r requirements.txt
echo -e "${GREEN}✓ Dependencies installed${NC}"

# 4. Git configuration
echo ""
echo -e "${YELLOW}Configuring Git...${NC}"
read -p "GitHub username: " GITHUB_USER
read -p "GitHub email: " GITHUB_EMAIL
git config user.name "$GITHUB_USER"
git config user.email "$GITHUB_EMAIL"
echo -e "${GREEN}✓ Git configured${NC}"

# 5. Add remote
echo ""
echo -e "${YELLOW}Connecting to GitHub...${NC}"
REPO_NAME="v10-trading-system"
git remote add origin https://github.com/$GITHUB_USER/$REPO_NAME.git 2>/dev/null || git remote set-url origin https://github.com/$GITHUB_USER/$REPO_NAME.git
git branch -M main
echo -e "${GREEN}✓ GitHub remote configured${NC}"

# 6. Push to GitHub
echo ""
echo -e "${YELLOW}Ready to push to GitHub${NC}"
read -p "Push to GitHub now? (y/n): " -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]; then
    echo -e "${YELLOW}Pushing code...${NC}"
    git push -u origin main
    echo -e "${GREEN}✓ Code pushed to GitHub${NC}"
    echo -e "${GREEN}Repository: https://github.com/$GITHUB_USER/$REPO_NAME${NC}"
fi

# 7. Deployment info
echo ""
echo -e "${YELLOW}======================================"
echo "DEPLOYMENT OPTIONS"
echo "======================================"
echo -e "${NC}"
echo "1. Railway (Recommended) - Auto-deploy"
echo "   → https://railway.app"
echo "   → New Project → Deploy from GitHub"
echo ""
echo "2. Render - Free tier available"
echo "   → https://render.com"
echo "   → New Web Service from GitHub"
echo ""
echo "3. Your VPS - Full control"
echo "   → Docker: docker-compose up -d"
echo ""

echo -e "${GREEN}Setup complete! 🎉${NC}"
echo ""
echo "Next steps:"
echo "1. Create repository: https://github.com/new"
echo "   Name: $REPO_NAME"
echo "2. Push code: git push -u origin main"
echo "3. Deploy: Choose option above"
echo ""
