---
title: "Apache Web Server Setup on Rocky Linux"
description: "Step-by-step guide to installing and configuring Apache/httpd web server on Rocky Linux"
image: "/images/it-ss/rocky-linux-apache.png"
date: 2024-11-13T17:00:00Z
draft: false
authors: ["Pratheba"]
tags: ["Rocky Linux", "Apache", "httpd", "Web Server", "Linux", "Server Configuration"]
categories: ["Technology"]
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

## Configuring the Firewall

Configure firewall to allow HTTP and HTTPS traffic:

```bash
# Allow HTTP traffic (port 80)
sudo firewall-cmd --permanent --add-service=http

# Allow HTTPS traffic (port 443)
sudo firewall-cmd --permanent --add-service=https

# Reload firewall configuration to apply changes
sudo firewall-cmd --reload

# Verify configured services
sudo firewall-cmd --list-all
```

## Testing the Apache Installation

**Test from command line:**
```bash
# Test local server response
curl http://localhost

# Test with verbose output
curl -v http://localhost
```

**Test from web browser:**
- Navigate to: `http://localhost` or `http://your-server-ip`
- You should see the Apache default page with message: **"Testing 123"** or similar

## Deploying a Web Page

### Step 1: Transfer Files
Copy files from local machine to server:
```bash
# Using SCP (if connecting remotely)
scp -P 2203 -r /home/pratheba/Documents/devwebsite pratheba@your-server-ip:/tmp/

# Or if working locally, simply copy
sudo cp -r /home/pratheba/Documents/devwebsite /var/www/html/
```

### Step 2: Set Proper Location
Move files to the web root directory:
```bash
# Move to web root (if copied to /tmp first)
sudo mv /tmp/devwebsite /var/www/html/

# Or create directly in web root
sudo mkdir -p /var/www/html/devwebsite
```

### Step 3: Configure Permissions
Set correct ownership and permissions:
```bash
# Set ownership to Apache user and group
sudo chown -R apache:apache /var/www/html/devwebsite

# Set directory permissions (755 = rwxr-xr-x)
sudo find /var/www/html/devwebsite -type d -exec chmod 755 {} \;

# Set file permissions (644 = rw-r--r--)
sudo find /var/www/html/devwebsite -type f -exec chmod 644 {} \;
```

> **Important**: Rocky Linux uses SELinux which requires additional configuration
## SELinux Configuration

### Step 1: Check Error Logs
View Apache error logs for SELinux issues:
```bash
# Check Apache error log
sudo tail -f /var/log/httpd/error_log

# Check SELinux audit log
sudo tail -f /var/log/audit/audit.log | grep httpd
```

### Step 2: Configure SELinux Context
Set proper SELinux context for web files:
```bash
# Check current SELinux context
ls -Z /var/www/html/devwebsite/index.html

# Restore proper SELinux context for web content
sudo restorecon -R /var/www/html/devwebsite/

# Verify the context has been updated
ls -Z /var/www/html/devwebsite/index.html

# Should show: httpd_exec_t or httpd_content_t
```

### Step 3: Set SELinux Booleans (if needed)
```bash
# Allow httpd to read user content (if files came from user directories)
sudo setsebool -P httpd_read_user_content 1

# Allow httpd network connections (if needed)
sudo setsebool -P httpd_can_network_connect 1
```

After completing these steps, the web page should load successfully.
