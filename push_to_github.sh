#!/bin/bash
# V10 Trading - Push to GitHub Script

GITHUB_USERNAME="KenproVp1"
REPO_NAME="v10-trading-system"

echo "========================================="
echo "V10 Trading System - GitHub Push"
echo "========================================="
echo ""
echo "Step 1: Create repository on GitHub"
echo "URL: https://github.com/$GITHUB_USERNAME/$REPO_NAME"
echo ""
echo "Step 2: Running git commands..."
echo ""

# Configure git with username and email
git config user.name "$GITHUB_USERNAME"

# Add remote
git remote add origin https://github.com/$GITHUB_USERNAME/$REPO_NAME.git

# Set main branch
git branch -M main

# Push to GitHub
git push -u origin main

echo ""
echo "========================================="
echo "Push Complete!"
echo "========================================="
echo ""
echo "Your repo is now at:"
echo "https://github.com/$GITHUB_USERNAME/$REPO_NAME"
echo ""
