#!/bin/bash

# Job Intelligence Platform - Quick Setup Script

echo "🚀 Setting up Job Intelligence Platform..."

# Check if virtual environment exists
if [ ! -d "venv" ]; then
    echo "Creating virtual environment..."
    python3 -m venv venv
fi

# Activate virtual environment
source venv/bin/activate

# Install/upgrade dependencies
echo "Installing dependencies..."
pip install --upgrade pip
pip install -r requirements.txt

# Create necessary directories
mkdir -p ml/data
mkdir -p ml/models
mkdir -p backend/api
mkdir -p frontend/components
mkdir -p deployment

# Check if data exists
if [ ! -f "ml/data/jobs_data.json" ]; then
    echo "No job data found. Running initial scraper..."
    python backend/scrapers/job_scraper.py
fi

# Check if models exist
if [ ! -f "ml/models/salary_model.h5" ]; then
    echo "No trained models found. Training models..."
    python ml/models/salary_predictor.py
    python ml/models/job_clusterer.py
fi

echo "✅ Setup complete!"
echo ""
echo "Available commands:"
echo "  python backend/scrapers/job_scraper.py    - Scrape new jobs"
echo "  python ml/embeddings/vector_engine.py     - Test vector search"
echo "  python ml/models/salary_predictor.py      - Train salary model"
echo "  python ml/models/job_clusterer.py         - Run clustering"
echo ""
echo "Current environment: $(which python3)"
echo "Project ready for development!"