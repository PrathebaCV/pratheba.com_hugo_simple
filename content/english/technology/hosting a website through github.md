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

Create a new repository in GitHub and clone it to your system terminal. Copy your desired files to the repository folder. using git commands, add, commit, push them to git.

When all the files are merged in to github, go to **settings** of your repository.
Click **Pages** option in the side menu that opena *Github pages*

Under the 'Source' tab in Build and deployment section click on **Deploy from a branch**

Select **main/ roots and then save** from 'Branch' section

Under the 'Custom Domain' type your **Domain name** then click **save**

This will turn to be an unsuccessful move and ask you to check the **DNS**

CLICK ON THE LINK- (Learn more about configuring custom domains) [https://docs.github.com/pages/configuring-a-custom-domain-for-your-github-pages-site]

Then click (Managing a custom domain for your GitHub Pages site)[https://docs.github.com/en/pages/configuring-a-custom-domain-for-your-github-pages-site/managing-a-custom-domain-for-your-github-pages-site]

you should go to godaddy.com or any of your service provider and edit the details of your DNS

change the alias name or **'A' NAME** OR (Optional - *AAAA* for IPV6)  and **CNAME** to those given in the managing custom domain page. Set the TTL as 600s which is the minimum and wait for 600s.

then use followin command for checking the connection and IP address
``` 
ping pratheba.com
```
use following command for DNS resolution and details like ANAME, CNAME

```
dig pratheba.com
```
![alt text](/images/it-ss/image.png)

Use the link provided in *Github pages* to go to the website