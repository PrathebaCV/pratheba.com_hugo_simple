---
title: "Apache Web Server Installation on Ubuntu Server 24"
description: "Quick guide to installing and configuring Apache web server on Ubuntu Server 24"
image: "/images/experiments/ubuntu-server-apache.png"
date: 2024-11-13T21:00:00Z
draft: false
authors: ["Pratheba"]
tags: ["Ubuntu Server", "Apache", "Web Server", "Linux", "Ubuntu 24"]
categories: ["Technology"]
---

# Apache Web Server Installation on Ubuntu Server 24

This guide provides step-by-step instructions for installing and configuring Apache web server on Ubuntu Server 24.

## Apache Web Server Installation

### Step 1: Update System and Install Apache
```bash
# Update package repository
sudo apt update

# Install Apache web server
sudo apt install -y apache2
```

### Step 2: Start and Enable Apache Service
```bash
# Start Apache service
sudo systemctl start apache2

# Enable Apache to start on boot
sudo systemctl enable apache2

# Check Apache service status
sudo systemctl status apache2
```
## Web File Deployment

### Step 3: Transfer Files from Host Computer
From your host computer (Windows/Mac/Linux), transfer files to the server:
```bash
# Copy files via SCP (adjust port number as needed)
scp -P 2204 -r /home/pratheba/Documents/devwebsite pratheba@localhost:/home/pratheba
```

### Step 4: Verify File Transfer
In the Ubuntu Server, verify files were transferred:
```bash
# List files in home directory
ls -la /home/pratheba/

# Check the transferred directory
ls -la /home/pratheba/devwebsite/
```

### Step 5: Copy to Web Root Directory
Copy files to Apache's web root directory:
```bash
# Copy website files to web root
sudo cp -r /home/pratheba/devwebsite /var/www/html/

# Verify the copy operation
ls -la /var/www/html/
```
## Set Proper Permissions

### Step 6: Configure File Ownership
Set correct ownership for Apache to serve the files:
```bash
# Set ownership to Apache user and group (www-data on Ubuntu)
sudo chown -R www-data:www-data /var/www/html/devwebsite

# Verify ownership change
ls -la /var/www/html/devwebsite
```

### Step 7: Set File Permissions
Configure appropriate file and directory permissions:
```bash
# Set directory permissions (755 = rwxr-xr-x)
sudo find /var/www/html/devwebsite -type d -exec chmod 755 {} \;

# Set file permissions (644 = rw-r--r--)
sudo find /var/www/html/devwebsite -type f -exec chmod 644 {} \;
```

## Testing the Website

### Step 8: Access Your Website
Test your website in a web browser:
```bash
# Test from command line
curl http://localhost/devwebsite/

# Or access via browser at:
# http://localhost:8004/devwebsite/index.html
# http://your-server-ip/devwebsite/
```

### Troubleshooting
```bash
# Check Apache error logs if issues occur
sudo tail -f /var/log/apache2/error.log

# Restart Apache if needed
sudo systemctl restart apache2
```