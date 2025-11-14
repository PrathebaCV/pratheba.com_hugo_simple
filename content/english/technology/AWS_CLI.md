---
title: "AWS CLI Setup and Configuration"
description: "Step-by-step guide to setting up and using AWS Command Line Interface for EC2 management"
image: "/images/experiments/aws-cli.png"
date: 2024-11-13T11:00:00Z
draft: false
authors: ["Pratheba"]
tags: ["AWS", "CLI", "EC2", "Linux", "Command Line"]
categories: ["Technology"]
---

# AWS CLI Setup and Configuration

This guide covers the essential steps for setting up and using AWS CLI to manage EC2 instances and install web servers.

## Initial Connection

Connect to your AWS EC2 instance using SSH with your PEM key: 
```bash
ssh -i /home/pratheba/Downloads/pratheba1.pem ec2-user@3.111.53.178
```
```bash
sudo yum update -y
```
```bash 
sudo yum install -y httpd
sudo systemctl start httpd
sudo systemctl enable httpd
sudo systemctl status httpd
```

## File Transfer to EC2

Copy files from your local machine to EC2 instance:
```bash
# Copy files from local machine to EC2
scp -i your-key.pem -r /path/to/your/website/* ec2-user@your-instance-ip:/tmp/
```

Move files to the web directory on your EC2 instance:

```bash
sudo cp -r /tmp/* /var/www/html/
sudo chown -R apache:apache /var/www/html/
sudo chmod -R 755 /var/www/html/
```
## Testing the Website

Test your website deployment:
```bash
curl http://your-ec2-public-ip-or-DNS
```

## Important Security Notes

Always verify which ports are open and listening:
- **Port 22**: SSH access
- **Port 80**: HTTP web traffic  
- **Port 443**: HTTPS secure web traffic

In this configuration, the web server listens on **port 80** for HTTP requests.