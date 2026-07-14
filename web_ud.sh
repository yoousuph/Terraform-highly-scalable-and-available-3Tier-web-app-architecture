#!/bin/bash

set -euo pipefail

# Log user data output
exec > >(tee /var/log/user-data.log | logger -t user-data) 2>&1

# Switch to root user
sudo su

# Update system
dnf update -y

# Install Nginx and AWS CLI
dnf install -y nginx awscli

# Enable and start Nginx
systemctl enable nginx
systemctl start nginx

# install nodejs
dnf install -y nodejs
node -v
npm -v

# Create application directory
mkdir /home/ec2-user/web

# Download application files from S3
aws s3 cp s3://yoousuph-terraform-netflix-files/web/ /home/ec2-user/web/ --recursive

# Change to application directory
cd /home/ec2-user/web

# Install dependencies
npm install

# Build the React application
npm run build

# Remove default nginx files
rm -rf /usr/share/nginx/html/*

# Copy React build output
cp -r /home/ec2-user/web/build/* /usr/share/nginx/html/

# Download custom nginx configuration
aws s3 cp s3://yoousuph-terraform-netflix-files/webapp/nginx.conf /etc/nginx/nginx.conf

# Restart nginx
systemctl restart nginx