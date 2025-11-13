---
title: "AWS S3 Web Hosting with CLI"
description: "Setting up static website hosting on AWS S3 using command line interface"
image: "/images/experiments/s3-hosting.png"
date: 2024-11-13T13:00:00Z
draft: false
authors: ["Pratheba"]
tags: ["AWS", "S3", "Static Hosting", "CLI", "Web Hosting"]
categories: ["Technology"]
---

> **Note**: This file contains experimental configurations and may need verification.

# Web Hosting on AWS S3 Using CLI

This guide demonstrates how to set up static website hosting on Amazon S3 using the AWS Command Line Interface.
## Enable static website hosting
```bash
aws s3 website s3://pratheba.com-bucket --index-document index.html --error-document error.html
```

## Make the bucket publicly readable
Your bucket needs a public read policy:
```bash 
# Create a bucket policy file (bucket-policy.json)
cat > bucket-policy.json << EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Sid": "PublicReadGetObject",
            "Effect": "Allow",
            "Principal": "*",
            "Action": "s3:GetObject",
            "Resource": "arn:aws:s3:::pratheba.com-bucket/*"
        }
    ]
}
EOF
```

## Apply the policy
```BASH
aws s3api put-bucket-policy --bucket pratheba.com-bucket --policy file://bucket-policy.json
```

## Disable "Block Public Access" settings
```bash
aws s3api put-public-access-block --bucket pratheba.com-bucket --public-access-block-configuration "BlockPublicAcls=false,IgnorePublicAcls=false,BlockPublicPolicy=false,RestrictPublicBuckets=false"
```

## Get your website endpoint
After enabling static hosting, your website will be available at:
http://pratheba.com-bucket.s3-website-<region>.amazonaws.com

You can find the exact URL in the S3 console under Properties > Static website hosting.

## Optional: Set up custom domain

If you want to use pratheba.com as your domain, you'll need to:

Configure Route 53 or your DNS provider

Consider using CloudFront for HTTPS and better performance

Your index.html file is already in the root, which is perfect for the main page. The folder structure you have should work well for a static site.RetryClaude does not have the ability to run the code it generates yet.D