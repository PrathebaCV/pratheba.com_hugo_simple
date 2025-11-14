---
title: "GitHub Repository Creation and Management"
description: "Complete guide to creating and managing GitHub repositories from web interface to command line"
image: "/images/experiments/github-repo.png"
date: 2024-11-13T12:00:00Z
draft: false
authors: ["Pratheba"]
tags: ["GitHub", "Git", "Version Control", "Repository Management"]
categories: ["Technology"]
---

# GitHub Repository Creation and Management

This comprehensive guide covers creating and managing GitHub repositories both through the web interface and command line tools.

## Creating a Repository in GitHub Website

1. **Create a GitHub account** (if you don't have one already)
2. **Click the '+' symbol** in the top right corner and select 'New Repository'
3. **Name your repository** and set it to public or private
4. **Click 'Create repository'** at the bottom
5. **Copy the SSH/HTTPS URL** provided for cloning

## Creating and Managing Git Repository in Terminal

### Initial Setup
1. **Open terminal** and navigate to your desired folder
2. **Clone the repository**:

```bash
# Clone the repository from GitHub
git clone <repository-ssh-or-https-url>

# Navigate into the cloned directory
cd <repository-name>
```

### Branch Management
Create and work with branches:

```bash
# Create and switch to a new branch
git checkout -b feature-branch

# View all branches
git branch

# Switch between branches
git checkout main
git checkout feature-branch
```

### Adding and Committing Files
```bash
# Create a new file
echo "Hello World" > file.txt

# Add file to staging area
git add file.txt
# Or add all files: git add .

# Commit changes
git commit -m "Add initial file with hello world content"

# Push to remote repository
git push

# For new branches, set upstream
git push --set-upstream origin feature-branch
```

## Managing Pull Requests

### Creating a Pull Request
1. **Push changes** to your feature branch - changes are updated in GitHub
2. **Navigate to GitHub** - you'll see a notification banner stating "feature-branch had recent pushes"
3. **Click "Compare & pull request"** button
4. **Fill out the PR form**:
   - Add a descriptive title
   - Write a detailed description of changes
   - Click "Create Pull Request"

### Merging Pull Request
1. **Review the changes** in the Pull Request tab
2. **Click "Merge pull request"** when ready
3. **Click "Confirm merge"** to complete the process
4. **Optionally delete** the feature branch after merging

### Best Practices
```bash
# Always pull latest changes before creating new branches
git checkout main
git pull origin main

# Create descriptive branch names
git checkout -b fix/login-bug
git checkout -b feature/user-dashboard
```
