---
title: "Apache Web Server Installation on AWS EC2"
description: "Complete guide to installing and configuring Apache web server on AWS EC2 instance"
image: "/images/it-ss/aws-apache-ec2.png"
date: 2024-11-13T19:00:00Z
draft: false
authors: ["Pratheba"]
tags: ["AWS", "EC2", "Apache", "Web Server", "Linux", "Cloud Hosting"]
categories: ["Technology"]
---

# Apache Web Server Installation on AWS EC2

This guide covers the complete process of installing and configuring Apache web server on an AWS EC2 instance.

## Connecting to Your Instance

Login to the AWS instance via SSH:
```bash
ssh -i /path/to/your/key.pem ec2-user@your-private-IP-address
```

## Installing Apache on Amazon Linux via SSH
First, connect to your EC2 instance via SSH, then run these commands

```bash
# Update the system packages
sudo yum update -y

# Install Apache web server
sudo yum install -y httpd

# Start Apache service
sudo systemctl start httpd

# Enable Apache to start automatically on boot
sudo systemctl enable httpd

# Check if Apache is running
sudo systemctl status httpd
```

## Configure Security Group (Important!)

Before your website is accessible, ensure your EC2 security group allows HTTP traffic:

Go to EC2 Console → Security Groups

Select your instance's security group

Add inbound rule: Type = HTTP, Port = 80, Source = 0.0.0.0/0

> Always make sure to create seperate security groups for http, icmp,ssh,https

## Upload and Host Your Website Files


#### Copy files from your local machine to EC2
```bash
    scp -i your-key.pem -r /path/to/your/website/* ec2-user@your-instance-ip:/tmp/
```

#### Then on your EC2 instance, move files to web directory
```bash
sudo cp -r /tmp/* /var/www/html/
sudo chown -R apache:apache /var/www/html/
sudo chmod -R 755 /var/www/html/
```

## TEST YOUR WEBSITE

Visit your website by navigating to:

http://your-ec2-public-ip

or 

http://your-ec2-public-dns

You can find your public IP/DNS in the EC2 console under your instance details.

