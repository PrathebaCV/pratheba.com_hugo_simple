---
title: "Website Hosting with GitHub Pages"
description: "Complete guide to hosting static websites for free using GitHub Pages"
image: "/images/experiments/github-pages.png"
date: 2024-11-13T14:00:00Z
draft: false
authors: ["Pratheba"]
tags: ["GitHub Pages", "Static Hosting", "Web Development", "Free Hosting"]
categories: ["Technology"]
---

# Hosting a Website Through GitHub Pages

This guide demonstrates how to host static websites for free using GitHub Pages, from repository creation to live deployment.

## Getting Started

### Step 1: Repository Setup
1. **Create a new repository** in GitHub
2. **Clone it locally**:
   ```bash
   git clone <repository-url>
   cd <repository-name>
   ```
3. **Add your website files** to the repository folder
4. **Commit and push** using git commands:
   ```bash
   git add .
   git commit -m "Add website files"
   git push origin main
   ```

### Step 2: Enable GitHub Pages
1. **Navigate to your repository** on GitHub
2. **Go to Settings** tab
3. **Click Pages** in the sidebar to open GitHub Pages settings
4. **Under 'Source'** in the Build and deployment section:
   - Select **"Deploy from a branch"**
5. **Under 'Branch'** section:
   - Select **"main"** branch
   - Select **"/ (root)"** folder
   - Click **"Save"**

## Optional: Custom Domain Configuration

### Step 3: Setting Up Custom Domain
1. **Under 'Custom Domain'** enter your domain name (e.g., `pratheba.com`)
2. **Click 'Save'** - This may initially fail and prompt DNS verification

### Step 4: DNS Configuration
Visit GitHub's documentation:
- [Configuring custom domains](https://docs.github.com/pages/configuring-a-custom-domain-for-your-github-pages-site)
- [Managing custom domain](https://docs.github.com/en/pages/configuring-a-custom-domain-for-your-github-pages-site/managing-a-custom-domain-for-your-github-pages-site)

### Step 5: DNS Provider Settings
**At your DNS provider** (GoDaddy, Namecheap, etc.):

1. **Add A records** pointing to GitHub Pages IP addresses:
   - `185.199.108.153`
   - `185.199.109.153`
   - `185.199.110.153`
   - `185.199.111.153`

2. **Add CNAME record** (for www subdomain):
   - Name: `www`
   - Value: `<username>.github.io`

3. **Set TTL to 600 seconds** (minimum recommended)
4. **Wait for DNS propagation** (up to 24 hours, usually faster)

## Verification and Testing

### Step 6: Verify DNS Configuration
**Check connectivity and IP address:**
```bash
ping pratheba.com
```

**Verify DNS resolution and records:**
```bash
# Check DNS resolution
dig pratheba.com

# Check specific record types
dig pratheba.com A
dig www.pratheba.com CNAME
```

### Step 7: Access Your Website
1. **Use the GitHub Pages URL** initially: `https://<username>.github.io/<repository>`
2. **After DNS propagation**, access via your custom domain: `https://pratheba.com`
3. **Enable HTTPS** in GitHub Pages settings for security

![DNS Configuration Example](/images/it-ss/image.png)

## Troubleshooting Tips
- DNS changes can take up to 24 hours to propagate
- Use `nslookup` or online DNS checkers to verify propagation
- Ensure your repository is public for GitHub Pages to work
- Check that your `index.html` file is in the root directory