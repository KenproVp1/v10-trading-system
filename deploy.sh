#!/bin/bash
# Deploy to production on any Linux server

set -e

echo "Pulling latest code..."
git pull origin main

echo "Installing dependencies..."
pip install -r requirements.txt

echo "Stopping old containers..."
docker-compose down

echo "Building and starting new containers..."
docker-compose up -d

echo "Checking status..."
docker-compose ps

echo "Deployment complete!"
echo "API: http://localhost:8000"
echo "Dashboard: http://localhost:8501"
