---
title: "CloudWatch and CloudTrail"
description: "Hands-on lab exercise covering AWS CloudWatch and CloudTrail setup and configuration"
image: "/images/it-ss/cloudwatch-cloudtrail.png"
date: 2024-11-13T15:00:00Z
draft: true
authors: ["Pratheba"]
tags: ["AWS", "CloudWatch", "CloudTrail", "Monitoring",]
categories: ["Technology"]
---

# CloudWatch and CloudTrail

This exercise demonstrates practical implementation of AWS CloudWatch and CloudTrail services for monitoring and auditing.

## 1. Create S3 Bucket

Create a new S3 bucket with kodekloud as a postfix in its name, and upload the file /root/static-website to the S3 bucket.
```bash
aws s3 mb s3://cpbucket25
aws s3 cp /root/static-website/ s3://cpbucket25/ --recursive
```
Verify Uploads in the S3 Console by navigating to the S3 service in the AWS Management Console and open your my-unique-bucket-kodekloud bucket to verify that your files have been uploaded successfully.
```bash
aws s3 ls s3://cpbucket25
```

## 2. Enable static website hosting
```bash
aws s3api put-bucket-website --bucket my-static-website-2025 --website-configuration '{
    "IndexDocument": {
        "Suffix": "index.html"
    }
}'
```

## 3. Make it public (remove public access block)
```bash
aws s3api put-public-access-block --bucket my-static-website-2025 --public-access-block-configuration "BlockPublicAcls=false,IgnorePublicAcls=false,BlockPublicPolicy=false,RestrictPublicBuckets=false"
```

## 4. Add public read policy
```bash

aws s3api put-bucket-policy --bucket my-static-website-2025 --policy '{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Principal": "*",
            "Action": "s3:GetObject",
            "Resource": "arn:aws:s3:::my-static-website-2025/*"
        }
    ]
}'
```
## CORS

>if the website dont work with those steps, use CORS

``` bash
cat > cors-config.json << 'EOF'
[
    {
        "AllowedHeaders": ["*"],
        "AllowedMethods": ["GET", "HEAD"],
        "AllowedOrigins": ["*"],
        "ExposeHeaders": []
    }
]
EOF
```

### Apply CORS configuration
```bash
aws s3api put-bucket-cors --bucket cpwebcreation --cors-configuration file://cors-config.json
```

# Update Website Content

### Sync new changes
```bash
aws s3 sync . s3://my-website-bucket-2025/ --delete
```

### Sync with cache control
```bash
aws s3 sync . s3://my-website-bucket-2025/ --cache-control "max-age=86400" --delete
```

## Delete all objects
```bash
aws s3 rm s3://my-website-bucket-2025/ --recursive
```
## Delete bucket
```bash
aws s3 rb s3://my-website-bucket-2025
```
# CREATING A CLOUDTRAIL AND CLOUDWATCH LOGS

Go to the CloudTrial service in AWS menu and open in a new tab 
 
 Click on the  ***Create trail*** button

 Then click create trail link as shown in the picture to create in the full workflow platform

 ![alt text](/images/it-ss/image-11.png)

 step 1 :  Enter A name

 step 2 : select a storage location
 
 step 3 ,  step 4 : Uncheck the check boxes 


![alt text](/images/it-ss/image-12.png)

![alt text](/images/it-ss/image-13.png)

![alt text](/images/it-ss/image-14.png)
![alt text](/images/it-ss/image-15.png)
![alt text](/images/it-ss/image-16.png)
![alt text](/images/it-ss/image-17.png)
click next and then click create trail in next page.

## create cloud watch

Go to the CLOUDWATCH service in AWS menu

click **log groups** option in the left side bar, there will be a log group we created during cloud trail creation.

click **log insights** option in the left side bar
![alt text](/images/it-ss/image-18.png)

see the logs

![alt text](/images/it-ss/image-19.png)