#!/bin/bash
# V10 TRADING - PUSH TO GITHUB - INTERACTIVE GUIDE

echo "======================================"
echo "V10 TRADING - GITHUB PUSH"
echo "======================================"
echo ""
echo "Step 1: Create Repository on GitHub"
echo ""
echo "1. Go to: https://github.com/new"
echo "2. Repository name: v10-trading-system"
echo "3. Description: AI-powered trading signals"
echo "4. Public (recommended)"
echo "5. Click 'Create repository'"
echo ""
echo "Press Enter when done..."
read

echo ""
echo "Step 2: Get Personal Access Token"
echo ""
echo "1. Go to: https://github.com/settings/tokens/new"
echo "2. Token name: v10-trading-push"
echo "3. Expiration: 90 days"
echo "4. Scopes: Check 'repo' and 'workflow'"
echo "5. Click 'Generate token'"
echo "6. COPY THE TOKEN IMMEDIATELY (shows only once!)"
echo ""
read -p "Enter your GitHub username: " GITHUB_USERNAME
read -sp "Enter Personal Access Token (paste here): " GITHUB_TOKEN
echo ""
echo ""

echo "Step 3: Configuring Git..."
git config user.name "KenproVp1"
git config user.email "your-email@gmail.com"
echo "✓ Git configured"

echo ""
echo "Step 4: Adding GitHub remote..."
git remote add origin https://github.com/KenproVp1/v10-trading-system.git
git branch -M main
echo "✓ Remote added"

echo ""
echo "Step 5: Pushing code to GitHub..."
echo "(Pushing...)"
git push -u origin main
echo "✓ Code pushed!"

echo ""
echo "======================================"
echo "SUCCESS! 🎉"
echo "======================================"
echo ""
echo "Your repository:"
echo "https://github.com/KenproVp1/v10-trading-system"
echo ""
echo "Next steps:"
echo "1. Visit repository URL"
echo "2. Verify all files are there"
echo "3. Deploy to Railway:"
echo "   - Go to: https://railway.app"
echo "   - New Project → Deploy from GitHub"
echo "   - Select: v10-trading-system"
echo "   - Deploy!"
echo ""
