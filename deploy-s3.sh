#!/bin/bash

# Simple Frontend S3 Deployment Script
# Make sure AWS CLI is configured with proper credentials

set -e

echo "🚀 Starting frontend deployment to S3..."

# Configuration - UPDATE THESE VALUES
BUCKET_NAME="your-frontend-bucket-name"
REGION="us-east-1"

# Build the application
echo "📦 Building application..."
npm run build

# Upload to S3
echo "☁️ Uploading to S3..."
aws s3 sync dist/ s3://$BUCKET_NAME --delete --region $REGION

# Set proper content types
echo "🔧 Setting content types..."
aws s3 cp s3://$BUCKET_NAME/index.html s3://$BUCKET_NAME/index.html \
    --content-type "text/html" --metadata-directive REPLACE

echo "✅ Frontend deployment completed!"
echo "Your app should be available at: http://$BUCKET_NAME.s3-website-$REGION.amazonaws.com"
