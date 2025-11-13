---
title: "Static Website Hosting Using AWS S3 Console"
description: "Complete guide to hosting static websites using AWS S3 through the web console interface"
image: "/images/it-ss/s3-static-hosting.png"
date: 2024-11-13T18:00:00Z
draft: false
authors: ["Pratheba"]
tags: ["AWS", "S3", "Static Hosting", "Web Console", "Website Hosting"]
categories: ["Technology"]
---

# Static Website Hosting Using AWS S3 Console

Step-by-step guide to hosting static websites using AWS S3 through the web console interface.

## Navigate to Your Bucket

Go to AWS S3 Console

Click on your bucket: pratheba.com-bucket

## Enable Static Website Hosting
Click the "Properties" tab
Scroll down to "Static website hosting"
Click "Edit"

## Configure Website Settings
Select "Enable" for static website hosting
Hosting type: Choose "Host a static website"
Index document: Enter index.html
Error document: Enter error.html (optional - you can skip this for now)
Click "Save changes"

## Make Bucket Publicly Accessible

### Unblock Public Access
Go to "Permissions" tab
Find "Block public access (bucket settings)"
Click "Edit"
Uncheck all 4 boxes (or at least uncheck "Block public policy")
Click "Save changes"
Type confirm when prompted

### Add Bucket Policy
Still in "Permissions" tab
Scroll to "Bucket policy"
Click "Edit"
Paste this policy (replace bucket name if needed):
￼
```bash
json
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
```
Click "Save changes"

## Get Your Website URL

Go back to "Properties" tab
Scroll to "Static website hosting"
You'll see your "Bucket website endpoint" URL
It will look like: http://pratheba.com-bucket.s3-website-us-east-1.amazonaws.com

## Test Your Website
Click on the endpoint URL or copy it to your browser
Your index.html should load
The console method is much more straightforward and avoids the CLI syntax issues you encountered!