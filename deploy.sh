#!/bin/bash

echo "🚀 Menarik update dari GitHub..."
git pull origin main

echo "🐳 Menjalankan Docker Compose..."
docker compose up -d --build

echo "✅ WordPress aktif di http://localhost:8000"
