#!/bin/bash

echo "Moving to ./public_html"
cd ./public_html
echo "Running gatsby clean"
gatsby clean
echo "Running gatsby build"
gatsby build

echo "Setting aws configure set preview.cloudfront true"
aws configure set preview.cloudfront true

echo "Running aws cloudfront create-invalidation"
aws cloudfront create-invalidation \
    --distribution-id E2NPH29TYNYP7 \
    --paths "/*"

echo "Running s3 sync"
aws s3 sync ./public s3://www.robertclarke.com --delete