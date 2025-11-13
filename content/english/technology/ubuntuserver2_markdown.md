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

## Install Apache Web Server

### Installation
   ```bash
   sudo apt update
   sudo apt install -y apache2
   ```
### Start-Enable-Status

```
sudo systemctl start apache2
sudo systemctl enable apache2
sudo systemctl status apache2
```
## Web file deployment 
From your host computer (Windows/Mac/Linux)
```bash
scp -P 2204 -r /home/pratheba/Documents/devwebsite pratheba@localhost:/home/pratheba
```
In the Virtualbox use
```bash
ls /home/pratheba/
```
to check if the file/folder is moved to local host

We cant move the files directly to web files folder. Hence move it in a temporary place and then move it to /
var/www/html
### Copy to var/www/html
```bash
sudo cp -r /home/pratheba/devwebsite /var/www/html/
```
## Set ownership for Apache
```bash
sudo chown www-data:www-data /var/www/html/devwebsite
```
## Set ownership for the folder
```bash
sudo chmod 755 /var/www/html/devwebsite
```
## Check with the web browser
- use 
```
 localhost:8004/devwebsite/index.html
```