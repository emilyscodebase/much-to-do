#!/bin/bash
echo "Deploying frontend to S3..."
cd Client
npm ci
npm run build
aws s3 sync dist/ s3://$S3_BUCKET_NAME --delete
aws cloudfront create-invalidation --distribution-id 
$CLOUDFRONT_DISTRIBUTION_ID --paths "/*"
echo "Frontend deployed successfully!"
