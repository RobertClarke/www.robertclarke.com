#!/bin/bash

aws configure set preview.cloudfront true

aws cloudfront create-invalidation \
    --distribution-id E2NPH29TYNYP7 \
    --paths "/*"

aws s3 sync ./public_html/public s3://www.robertclarke.com --delete