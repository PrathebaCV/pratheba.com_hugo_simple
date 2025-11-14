---
title: "Ubuntu Server VirtualBox + Apache Web Server Setup"
description: "Comprehensive guide to setting up Ubuntu Server in VirtualBox with Apache web server configuration"
image: "/images/it-ss/ubuntu-apache.png"
date: 2024-11-13T16:00:00Z
draft: true
authors: ["Pratheba"]
tags: ["Ubuntu", "VirtualBox", "Apache", "Web Server", "Linux", "Server Setup"]
categories: ["Technology"]
---

# Ubuntu Server VirtualBox + Apache Web Server Setup Guide

Complete step-by-step guide to setting up Ubuntu Server in VirtualBox with Apache web server configuration.

## Table of Contents
1. [Prerequisites](#prerequisites)
2. [VirtualBox Setup](#virtualbox-setup)
3. [Ubuntu Server Installation](#ubuntu-server-installation)
4. [Initial Server Configuration](#initial-server-configuration)
5. [Apache Web Server Installation](#apache-web-server-installation)
6. [Web File Deployment](#web-file-deployment)
7. [Network Configuration](#network-configuration)
8. [Troubleshooting](#troubleshooting)
9. [Security Considerations](#security-considerations)

## Prerequisites

### Download Required Files
```bash
# Ubuntu Server ISO (Latest LTS)
wget https://ubuntu.com/download/server
# Download Ubuntu Server 22.04 LTS or latest version

# VirtualBox (if not installed)
# Visit: https://www.virtualbox.org/wiki/Downloads
```

### System Requirements
- Host machine with at least 4GB RAM
- 20GB free disk space
- VirtualBox 6.0 or later
- Internet connection

## VirtualBox Setup

### 1. Create New Virtual Machine
```bash
# Open VirtualBox and create new VM
# Name: Ubuntu-Server
# Type: Linux
# Version: Ubuntu (64-bit)
```

### 2. Configure VM Settings
```bash
# Memory Settings
RAM: 2048 MB (minimum) / 4096 MB (recommended)

# Storage Settings
Create virtual hard disk: 20 GB (minimum)
Format: VDI (VirtualBox Disk Image)
Storage: Dynamically allocated

# Network Settings
Adapter 1: NAT (for internet access)
Adapter 2: Host-only Adapter (for local access)
```

### 3. Advanced VM Configuration
```bash
# System Settings
Processor: 2 CPUs (if available)
Boot Order: Optical, Hard Disk
Enable PAE/NX: Checked

# Display Settings
Video Memory: 16 MB
Graphics Controller: VBoxVGA
```

## Ubuntu Server Installation

### 1. Boot from ISO
```bash
# Mount Ubuntu Server ISO to VM
# Start the VM
# Select "Install Ubuntu Server"
```

### 2. Installation Configuration
```bash
# Language: English
# Keyboard Layout: English (US)
# Network Configuration: Use DHCP (default)
# Proxy: Leave blank
# Mirror: Default Ubuntu archive mirror
```

### 3. Storage Configuration
```bash
# Storage Layout: Use entire disk
# File System: ext4
# Confirm destructive action: Continue
```

### 4. Profile Setup
```bash
# Your name: Admin User
# Server name: ubuntu-server
# Username: pratheba
# Password: [Create strong password]
```

### 5. SSH and Packages
```bash
# Install OpenSSH server: Yes
# Featured Server Snaps: Leave blank for now
# Installation will complete automatically
```

## Initial Server Configuration

### 1. First Boot and Updates
```bash
# After reboot, login with your credentials
# Update system packages
sudo apt update && sudo apt upgrade -y

# Install essential packages
sudo apt install -y curl wget vim net-tools htop tree
```

### 2. Configure Network (if needed)
```bash
# Check network interfaces
ip addr show

# Edit netplan configuration if needed
sudo nano /etc/netplan/00-installer-config.yaml

# Apply network changes
sudo netplan apply
```

### 3. Configure Firewall
```bash
# Enable UFW firewall
sudo ufw enable

# Allow SSH
sudo ufw allow ssh

# Allow HTTP and HTTPS
sudo ufw allow 80/tcp
sudo ufw allow 443/tcp
sudo ufw allow 8004/tcp

# Check firewall status
sudo ufw status
```

## Apache Web Server Installation

### 1. Install Apache
```bash
# Install Apache web server
sudo apt update
sudo apt install -y apache2

# Start and enable Apache
sudo systemctl start apache2
sudo systemctl enable apache2

# Check Apache status
sudo systemctl status apache2
```

### 2. Configure Apache Ports
```bash
# Edit ports configuration
sudo nano /etc/apache2/ports.conf

# Add these lines (keep existing Listen 80)
Listen 80
Listen 8004
```

### 3. Create Virtual Host for Port 8004
```bash
# Create virtual host configuration
sudo nano /etc/apache2/sites-available/8004.conf

# Add this configuration:
```

```bash
apache
<VirtualHost *:8004>
    ServerAdmin webmaster@localhost
    DocumentRoot /var/www/html
    ErrorLog ${APACHE_LOG_DIR}/error.log
    CustomLog ${APACHE_LOG_DIR}/access.log combined
    
    <Directory /var/www/html>
        Options Indexes FollowSymLinks
        AllowOverride None
        Require all granted
    </Directory>
</VirtualHost>
```

### 4. Enable Virtual Host
```bash
# Enable the site
sudo a2ensite 8004.conf

# Test Apache configuration
sudo apache2ctl configtest

# Reload Apache
sudo systemctl reload apache2

# Verify Apache is listening on both ports
sudo ss -tlnp | grep apache
```

## Web File Deployment

### 1. Prepare Web Directory
```bash
# Set proper ownership and permissions
sudo chown -R www-data:www-data /var/www/html/
sudo chmod -R 755 /var/www/html/

# Remove default Apache page (optional)
sudo rm /var/www/html/index.html
```

### 2. Create Sample Web Files
```bash
# Create main index file
sudo tee /var/www/html/index.html > /dev/null << 'EOF'
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Welcome to My Server</title>
    <style>
        body { font-family: Arial, sans-serif; margin: 40px; }
        .container { max-width: 800px; margin: 0 auto; }
        .header { color: #333; border-bottom: 2px solid #007acc; }
        .info { background: #f4f4f4; padding: 20px; margin: 20px 0; }
    </style>
</head>
<body>
    <div class="container">
        <h1 class="header">Welcome to Ubuntu Server</h1>
        <div class="info">
            <h2>Server Information</h2>
            <p><strong>Server:</strong> Apache/2.4.58 (Ubuntu)</p>
            <p><strong>Status:</strong> Running</p>
            <p><strong>Ports:</strong> 80, 8004</p>
        </div>
        <h2>Available Pages</h2>
        <ul>
            <li><a href="/info.php">PHP Info</a> (if PHP installed)</li>
            <li><a href="/test.html">Test Page</a></li>
        </ul>
    </div>
</body>
</html>
EOF

# Create test page
sudo tee /var/www/html/test.html > /dev/null << 'EOF'
<!DOCTYPE html>
<html>
<head>
    <title>Test Page</title>
</head>
<body>
    <h1>Apache Test Page</h1>
    <p>If you can see this page, Apache is working correctly!</p>
    <p>Current time: <span id="time"></span></p>
    <script>
        document.getElementById('time').innerHTML = new Date().toString();
    </script>
</body>
</html>
EOF

# Set proper permissions
sudo chmod 644 /var/www/html/*.html
sudo chown www-data:www-data /var/www/html/*.html
```

### 3. Create Project Directory Structure
```bash
# Create a project directory
sudo mkdir -p /var/www/html/myproject

# Create project files
sudo tee /var/www/html/myproject/index.html > /dev/null << 'EOF'
<!DOCTYPE html>
<html>
<head>
    <title>My Project</title>
    <link rel="stylesheet" href="style.css">
</head>
<body>
    <header>
        <h1>My Web Project</h1>
    </header>
    <main>
        <p>Welcome to my project running on Ubuntu Server!</p>
    </main>
    <script src="script.js"></script>
</body>
</html>
EOF

# Create CSS file
sudo tee /var/www/html/myproject/style.css > /dev/null << 'EOF'
body {
    font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
    margin: 0;
    padding: 20px;
    background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
    color: white;
}

header {
    text-align: center;
    margin-bottom: 30px;
}

main {
    max-width: 800px;
    margin: 0 auto;
    background: rgba(255,255,255,0.1);
    padding: 30px;
    border-radius: 10px;
    backdrop-filter: blur(10px);
}
EOF

# Create JavaScript file
sudo tee /var/www/html/myproject/script.js > /dev/null << 'EOF'
document.addEventListener('DOMContentLoaded', function() {
    console.log('Page loaded successfully!');
    
    // Add current date
    const dateElement = document.createElement('p');
    dateElement.textContent = 'Page loaded on: ' + new Date().toLocaleString();
    document.querySelector('main').appendChild(dateElement);
});
EOF

# Fix permissions for project directory
sudo chmod -R 755 /var/www/html/myproject/
sudo find /var/www/html/myproject/ -type f -exec chmod 644 {} \;
sudo chown -R www-data:www-data /var/www/html/myproject/
```

## Network Configuration

### 1. Configure VirtualBox Network
```bash
# VirtualBox Manager → Your VM → Settings → Network
# Adapter 1: NAT (for internet)
# Adapter 2: Host-only Adapter (for local access)

# Find host-only adapter IP
ip addr show enp0s8  # Usually the second adapter
```

### 2. Access from Host Machine
```bash
# Find VM IP address
hostname -I

# Test connectivity from host
# Replace [VM_IP] with actual IP
ping [VM_IP]
curl http://[VM_IP]
curl http://[VM_IP]:8004
```

### 3. Port Forwarding (Alternative Method)
```bash
# VirtualBox Manager → Your VM → Settings → Network → Advanced → Port Forwarding
# Add rules:
# Name: HTTP, Protocol: TCP, Host Port: 8080, Guest Port: 80
# Name: HTTP-8004, Protocol: TCP, Host Port: 8004, Guest Port: 8004

# Access from host browser:
# http://localhost:8080
# http://localhost:8004
```

## Testing and Verification

### 1. Test Apache Installation
```bash
# Check Apache service status
sudo systemctl status apache2

# Test local connections
curl localhost
curl localhost:8004
curl localhost/test.html
curl localhost:8004/myproject/

# Check listening ports
sudo ss -tlnp | grep apache

# View Apache processes
ps aux | grep apache
```

### 2. Test Web Files
```bash
# Test main page
wget -O - http://localhost

# Test project directory
wget -O - http://localhost/myproject/

# Test file permissions
ls -la /var/www/html/
ls -la /var/www/html/myproject/
```

### 3. Check Logs
```bash
# Apache access log
sudo tail -f /var/log/apache2/access.log

# Apache error log
sudo tail -f /var/log/apache2/error.log

# System log
sudo journalctl -u apache2 -f
```

## Troubleshooting

### Common Issues and Solutions

#### Apache Won't Start
```bash
# Check configuration syntax
sudo apache2ctl configtest

# Check for port conflicts
sudo ss -tlnp | grep :80
sudo ss -tlnp | grep :8004

# Restart Apache
sudo systemctl stop apache2
sudo systemctl start apache2
```

#### Permission Denied Errors
```bash
# Fix web directory permissions
sudo chmod -R 755 /var/www/html/
sudo find /var/www/html/ -type f -exec chmod 644 {} \;
sudo chown -R www-data:www-data /var/www/html/

# Check SELinux (if applicable)
getenforce  # Should show "Disabled" on Ubuntu
```

#### Connection Refused
```bash
# Check if Apache is running
sudo systemctl status apache2

# Check firewall
sudo ufw status
sudo ufw allow 80/tcp
sudo ufw allow 8004/tcp

# Check network connectivity
ip addr show
ping -c 4 8.8.8.8
```

#### 403 Forbidden Error
```bash
# Check directory permissions
ls -la /var/www/html/

# Check Apache error log
sudo tail -10 /var/log/apache2/error.log

# Verify virtual host configuration
sudo apache2ctl -S
```

### Diagnostic Commands
```bash
# System information
uname -a
lsb_release -a

# Network diagnostics
ip route show
netstat -rn
ss -tuln

# Disk space
df -h
du -sh /var/www/html/

# Memory usage
free -h
htop
```

## Security Considerations

### 1. Basic Security Hardening
```bash
# Update system regularly
sudo apt update && sudo apt upgrade -y

# Configure automatic security updates
sudo apt install unattended-upgrades
sudo dpkg-reconfigure unattended-upgrades

# Disable unnecessary services
sudo systemctl list-unit-files --type=service --state=enabled
```

### 2. Apache Security
```bash
# Hide Apache version
sudo nano /etc/apache2/conf-available/security.conf
# Set: ServerTokens Prod
# Set: ServerSignature Off

# Enable security headers
sudo a2enmod headers
sudo systemctl reload apache2
```

### 3. Firewall Configuration
```bash
# Review firewall rules
sudo ufw status numbered

# Allow only necessary ports
sudo ufw default deny incoming
sudo ufw default allow outgoing
sudo ufw allow ssh
sudo ufw allow 80/tcp
sudo ufw allow 8004/tcp
```

### 4. Backup Strategy
```bash
# Create backup script
sudo tee /home/pratheba/backup-web.sh > /dev/null << 'EOF'
#!/bin/bash
DATE=$(date +%Y%m%d_%H%M%S)
BACKUP_DIR="/home/pratheba/backups"
mkdir -p $BACKUP_DIR

# Backup web files
tar -czf $BACKUP_DIR/web_files_$DATE.tar.gz /var/www/html/

# Backup Apache configuration
tar -czf $BACKUP_DIR/apache_config_$DATE.tar.gz /etc/apache2/

echo "Backup completed: $DATE"
EOF

chmod +x /home/pratheba/backup-web.sh

# Run backup
./backup-web.sh
```

## Quick Reference Commands

### Apache Management
```bash
# Start/Stop/Restart Apache
sudo systemctl start apache2
sudo systemctl stop apache2
sudo systemctl restart apache2
sudo systemctl reload apache2

# Check Apache status
sudo systemctl status apache2
sudo apache2ctl status

# Test configuration
sudo apache2ctl configtest
```

### File Management
```bash
# Navigate to web directory
cd /var/www/html/

# Edit files
sudo nano /var/www/html/index.html

# Set permissions
sudo chmod 755 /var/www/html/
sudo chmod 644 /var/www/html/*.html
sudo chown -R www-data:www-data /var/www/html/
```

### Network Testing
```bash
# Test local connections
curl localhost
curl localhost:8004
curl localhost/myproject/

# Check ports
sudo ss -tlnp | grep apache
sudo netstat -tlnp | grep apache

# Test from outside
wget http://[VM_IP]
wget http://[VM_IP]:8004
```

---

## Success Verification Checklist

- [ ] VirtualBox VM created and running
- [ ] Ubuntu Server installed and updated
- [ ] Apache installed and running
- [ ] Apache listening on ports 80 and 8004
- [ ] Web files accessible via browser
- [ ] Proper file permissions set
- [ ] Firewall configured
- [ ] Network connectivity working
- [ ] Error logs show no critical issues

**Your Ubuntu Server with Apache is now ready for web development!**

Access your server:
- Main site: `http://[VM_IP]` or `http://localhost:8080`
- Port 8004: `http://[VM_IP]:8004` or `http://localhost:8004`
- Project: `http://[VM_IP]/myproject/`