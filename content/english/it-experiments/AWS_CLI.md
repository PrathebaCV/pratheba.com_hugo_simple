---
title: "AWS CLI Setup and Configuration"
description: "Step-by-step guide to setting up and using AWS Command Line Interface for EC2 management"
image: "/images/experiments/aws-cli.png"
date: 2024-11-13T11:00:00Z
draft: false
authors: ["Pratheba"]
tags: ["AWS", "CLI", "EC2", "Linux", "Command Line"]
categories: ["IT Experiments"]
---

# AWS CLI Setup and Configuration

This guide covers the essential steps for setting up and using AWS CLI to manage EC2 instances and install web servers.

## Initial Connection

Login to the AWS CLI using PEM key and username: 
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

```bash
# Copy files from your local machine to EC2
scp -i your-key.pem -r /path/to/your/website/* ec2-user@your-instance-ip:/tmp/
```

# Then on your EC2 instance, move files to web directory

```bash
sudo cp -r /tmp/* /var/www/html/
sudo chown -R apache:apache /var/www/html/
sudo chmod -R 755 /var/www/html/
```
# TESTING THE WEBSITE

```bash
curl http://your-ec2-public-ip-or-DNS
```
## caution

Always note which port it is connected to.

eg: 22, 80,443

In this case the listening port was 80 (i.e., http)