#!/bin/bash

# Deploy to jaspermatters.com via GitHub Pages
# This script prepares and deploys the Job Intelligence Platform

echo "🚀 Deploying Job Intelligence Platform to jaspermatters.com..."

# Ensure we're in the right directory
cd /Users/matthewscott/Projects/jaspermatters-job-intelligence

# Check if gh-pages branch exists, create if not
if ! git show-ref --verify --quiet refs/heads/gh-pages; then
    echo "Creating gh-pages branch..."
    git checkout --orphan gh-pages
    git rm -rf .
    echo "jaspermatters.com" > CNAME
    git add CNAME
    git commit -m "Initial gh-pages setup with CNAME"
    git checkout main
else
    echo "gh-pages branch exists"
fi

# Ensure CNAME file exists in main branch for GitHub Pages
echo "jaspermatters.com" > CNAME

# Add all changes
git add .
git commit -m "Deploy Job Intelligence Platform with live demos"

# Push to GitHub
echo "Pushing to GitHub..."
git push origin main

# Deploy to gh-pages
echo "Deploying to GitHub Pages..."
git subtree push --prefix=. origin gh-pages

echo "✅ Deployment complete!"
echo "🌐 Your site will be live at https://jaspermatters.com in a few minutes"
echo ""
echo "Next steps:"
echo "1. Go to GitHub repository settings"
echo "2. Navigate to Pages section"
echo "3. Ensure source is set to 'Deploy from a branch'"
echo "4. Select 'gh-pages' branch and '/ (root)' folder"
echo "5. Add custom domain: jaspermatters.com"
echo ""
echo "DNS Configuration needed at your domain registrar:"
echo "  A     185.199.108.153"
echo "  A     185.199.109.153"
echo "  A     185.199.110.153"
echo "  A     185.199.111.153"
echo "  CNAME www -> guitargnar.github.io"