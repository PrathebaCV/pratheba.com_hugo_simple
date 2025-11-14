---
title: "AWS Systems Manager Sub-Services Overview"
description: "Comprehensive guide to AWS Systems Manager sub-services and their operational capabilities"
image: "/images/it-ss/systems-manager.png"
date: 2024-11-13T20:00:00Z
draft: false
authors: ["Pratheba"]
tags: ["AWS", "Systems Manager", "Operations", "Monitoring", "Management"]
categories: ["Technology"]
---

# AWS Systems Manager Sub-Services Overview

This document provides an overview of the various sub-services available within AWS Systems Manager for operational management and monitoring.

## AWS Systems Manager Sub-Services

### **Explorer**
View an aggregated dashboard of operational data across AWS services.

### **OpsCenter**
Centralize operational issues (OpsItems) for diagnosis and resolution.

### **CloudWatch Dashboard**
Monitor and visualize metrics across multiple AWS services in real-time.

### **Incident Manager**
Automate incident response plans for faster resolution of critical issues.

### **Application Manager**
Manage and visualize your application resources in one centralized location.

### **AppConfig**
Safely deploy configuration changes to applications across environments.

### **Parameter Store**
Securely store and manage configuration data and secrets.

### **Change Manager**
Automate and approve changes in a controlled, auditable manner.
## Automation: 
Automate common maintenance tasks such as restarting instances.
## Change Calendar: 
Schedule changes to avoid conflicts during critical periods.
## Maintenance Windows: 
Define time periods for maintenance tasks like patching or updates.
## Fleet Manager: 
Simplify the management of EC2 instances and servers from a single console.
## Compliance: 
Check if instances comply with security policies and desired configurations.
## Inventory: 
Track and manage installed software and configurations on instances.
## Hybrid Activations: 
Manage on-premises servers and VMs as if they were AWS instances.
## Session Manager: 
Securely connect to and manage EC2 instances without the need for SSH.
## Run Command: 
Remotely execute commands across your fleet of instances.
## State Manager: 
Define and enforce desired configurations on your instances.
## Patch Manager: 
Automate patching of instances to keep them updated.
## Distributor: 
Distribute software packages and updates to your instances.
## Documents: 
Create and manage SSM documents to define actions for your instances.

# Auto Scaling
Manual Scaling: Manually adjust the number of running instances based on real-time needs.

Scheduled Scaling: Automatically scale resources at specific times to handle predictable workloads.

Dynamic Scaling: Automatically scale based on demand using metrics such as CPU utilization or network traffic.

Target Tracking Scaling: Maintain a specific target (e.g., 50% CPU utilization) by automatically adjusting resources.

Step and Simple Scaling Policies: Increase or decrease capacity in steps based on specific thresholds.

Scaling Policy Based on Amazon SQS: Scale based on the number of messages in an Amazon SQS queue.

Predictive Scaling: Use machine learning to predict future traffic and automatically scale in advance.

Scaling Cooldowns: Avoid scaling up or down too quickly by setting cool-down periods between scaling actions.