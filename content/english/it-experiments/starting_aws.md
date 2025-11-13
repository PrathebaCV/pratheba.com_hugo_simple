---
title: "Getting Started with AWS - Account Creation and EC2 Setup"
description: "Step-by-step guide to creating an AWS account and launching your first EC2 instance"
image: "/images/experiments/aws-getting-started.png"
date: 2024-11-13T09:00:00Z
draft: false
authors: ["Pratheba"]
tags: ["AWS", "Account Setup", "EC2", "Cloud Computing", "Getting Started"]
categories: ["IT Experiments"]
---

# Creating an AWS Account and Launching Your First Instance

This comprehensive guide walks you through setting up an AWS account and creating your first EC2 instance.

## AWS Account Setup

For creating an aws account, one should have an email id, a debit/credit card with international banking allowed, a pan card.

Go to AWS login page and click on *sign in*

Enter your name, phone number, mail id in first step 

Verify the mail id in second step.

Enter address in third step

Enter bank details in fourth step

Verify with otp in mail/ phone is the fifth step

Always check on the location of the top right to ensure you are in the correct Region or Zone

## CREATING A NEW EC2 INSTANCE

Click on the menu grid to access various services in AWS

Click on EC2, seen under the 'Computing' section

To get started, launch an Amazon EC2 instance, which is a virtual server in the cloud.

![alt text](/images/it-ss/image-1.png)

click on the launch instance and give it a name.

![alt text](/images/it-ss/image-2.png)

We are selecting AWS Linux as AMI, with the default specs.

![alt text](/images/it-ss/image-3.png)

Select the desired Architecture and Instance type

![alt text](/images/it-ss/image-4.png)

Select Create Keypair and give it a name, select keypair type as RSA, private key file format as PEM and click 'Create Key pair'

![alt text](/images/it-ss/image-6.png)

In the Firewall (security groups) select *Create security group* radio button and tick all the check boxes to allow ssh, http, https traffics

Set storage value in *configure storage* section and the check the details in 'Summary'. finally click on **Launch instance**
![alt text](/images/it-ss/image-7.png)

The instance is successfully launched.

![alt text](/images/it-ss/image-8.png)

Go to the instance section and click the check box before the name of your instance to view the details like its status and others that are marked black in the given picture.

![alt text](/images/it-ss/image-10.png)
