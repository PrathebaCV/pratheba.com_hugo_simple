---
title: "Apache Web Server Setup on Rocky Linux"
description: "Step-by-step guide to installing and configuring Apache/httpd web server on Rocky Linux"
image: "/images/it-ss/rocky-linux-apache.png"
date: 2024-11-13T17:00:00Z
draft: false
authors: ["Pratheba"]
tags: ["Rocky Linux", "Apache", "httpd", "Web Server", "Linux", "Server Configuration"]
categories: ["IT Experiments"]
---

# Getting Started with Apache on Rocky Linux

This comprehensive guide demonstrates how to install and configure Apache/httpd web server on Rocky Linux distribution.

First, update the system:
```bash
sudo dnf update -y
```

Install the web server:
```bash
sudo dnf install httpd -y
```

Start and enable the web server:
```bash
# Start the service
sudo systemctl start httpd

# Enable the service to start on boot
sudo systemctl enable httpd

# Check if it is running
sudo systemctl status httpd
```

# Configuring the Firewall

Configure firewall to allow HTTP and HTTPS traffic:

```bash
# Allow HTTP traffic
sudo firewall-cmd --permanent --add-service=http

# Allow HTTPS traffic
sudo firewall-cmd --permanent --add-service=https

# Reload firewall configuration
sudo firewall-cmd --reload

# List all configured services
sudo firewall-cmd --list-all
```

# Testing the Apache Installation

Test from the server:
```bash
curl http://localhost
```

Test from web browser:
- Open your browser and navigate to: `localhost:8003`
- You should see the message: **IT WORKS**

# Deploying a Web Page

1. Copy files from local server to web server:
```bash
scp -P 2203 -r /home/pratheba/Documents/devwebsite pratheba@localhost:/tmp/
```

2. Move files to the web root directory:
```bash
sudo mv /tmp/devwebsite /var/www/html/
```

3. Set proper permissions:
```bash
# Set ownership to Apache user
sudo chown -R apache:apache /var/www/html/devwebsite

# Set correct file permissions
sudo chmod -R 755 /var/www/html/devwebsite
```

> **Note**: Unlike Ubuntu, Rocky Linux requires additional SELinux configuration
# SELinux Configuration

1. Switch to root user and check error logs:
```bash
sudo su -
cat /var/log/httpd/error_log
```

2. Troubleshoot SELinux context:
```bash
# Check current SELinux context
ls -Z /var/www/html/devwebsite/index.html

# Restore proper SELinux context
restorecon -R /var/www/html/devwebsite/

# Verify the context has been updated
ls -Z /var/www/html/devwebsite/index.html
```

After completing these steps, the web page should load successfully.
