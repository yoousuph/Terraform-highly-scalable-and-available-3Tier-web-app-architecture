#!/bin/bash

# Exit immediately if a command fails
set -e

# Log all output
exec > >(tee /var/log/user-data.log | logger -t user-data) 2>&1

# user data start
echo "========== User Data Started =========="

# Update packages
dnf update -y

# Install Nginx and start
dnf install -y nginx
systemctl enable nginx
systemctl start nginx

# Install NVM
curl -fsSL curl -fsSL https://raw.githubusercontent.com/yoousuph/High-Availability-and-Scalability-in-a-3-Tier-Web-Architecture/main/install.sh | bash

export NVM_DIR="/root/.nvm"

if [ -s "$NVM_DIR/nvm.sh" ]; then
    . "$NVM_DIR/nvm.sh"
else
    echo "ERROR: NVM installation failed."
    exit 1
fi

# Install Node.js
nvm install 16
nvm use 16
node -v
npm -v

# Prepare web directory
mkdir -p web

# Download application files
aws s3 cp s3://yoousuph-terraform-netflix-files/webapp/web/ /home/ec2-user/web/ --recursive

# Build application
cd /home/ec2-user/web/
npm install
npm run build

# Remove existing files in nginx directory
rm -rf /usr/share/nginx/html/*

# Copy built application to nginx directory
cp -r /home/ec2-user/web/build/* /usr/share/nginx/html/

# Download rendered nginx.conf
aws s3 cp s3://yoousuph-terraform-netflix-files/webapp/nginx.conf /etc/nginx/nginx.conf

# Restart nginx
systemctl restart nginx

echo "========== User Data Completed Successfully =========="