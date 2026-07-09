#!/bin/bash

# Step 1: Update the system
sudo dnf update -y

# Step 3: Install Git (if not already installed)
sudo dnf install git -y

# insttall NVM (Node Version Manager) 
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.3/install.sh | bash
source ~/.bashrc
nvm install 16
nvm use 16

# copy the app files from the S3 bucket to the /app directory
aws s3 cp s3://yoousuph-terraform-netflix-files/webapp/app/ /app --recursive

# go to the app directory
cd ~/app

# Install dependencies
npm install

# Install PM2
npm install -g pm2

# start the application with PM2
pm2 start index.js

# save the PM2 process list and corresponding environments
pm2 save



