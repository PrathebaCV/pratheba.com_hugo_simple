---
title: "GitHub Repository Creation and Management"
description: "Complete guide to creating and managing GitHub repositories from web interface to command line"
image: "/images/experiments/github-repo.png"
date: 2024-11-13T12:00:00Z
draft: false
authors: ["Pratheba"]
tags: ["GitHub", "Git", "Version Control", "Repository Management"]
categories: ["IT Experiments"]
---

# GitHub Repository Creation and Management

This comprehensive guide covers creating and managing GitHub repositories both through the web interface and command line tools.

## Creating a Repository in GitHub Website


Create a new Github account.
Press the '+' symbol on the top right to and click on 'New Repository'
Name it, set it to public, then click 'Create rpository' on the bottom.

copy ssh/http the link given

## CREATING A GIT REPOSITORY IN TERMINAL AND ADD FILES
   
Open the terminal.
Go to the desired folder.


```bash
git init
git clone <the given ssh/http of repository>

```

Get iside the folder, type this to create a branch.

```bash
   git checkout -b sidestage
```

To see the number of branches
```bash
   git branch
```

Create a file using 'echo' 

```bash
echo "Hello World" >> file.txt
```   
Add file to github 

```bash
git add file.txt 
```
   
Create first commit and push

```bash
git commit -m "first file"
git push
git push --set-upstream origin Side
```

## MANAGING PULL REQUEST

- When you push, the change you made is updated to the respective branch in the github.
- Go to the Github and you would have received a notification from the sidestage branch, stating 'side had recent pushes'
- Click on 
     > Compare and Pull request
- It takes you to "Open pull request" page
- Add Title & Description and click on "CREATE PULL REQUEST" 
- It will take you to 'Pull request tab'.
Then click on 'merge pull request' and 'confirm merge'
