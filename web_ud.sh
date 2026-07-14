#!/bin/bash

# Stop on first error
set -e

# Log everything
exec > >(tee /var/log/user-data.log | logger -t user-data) 2>&1

echo "========== USER DATA STARTED =========="

# Update packages
dnf update -y

# Install required packages
dnf install -y nginx awscli git

# Enable and start nginx
systemctl enable nginx
systemctl start nginx

# Install NVM
curl -fsSL https://raw.githubusercontent.com/yoousuph/High-Availability-and-Scalability-in-a-3-Tier-Web-Architecture/main/install.sh | bash

# Load NVM
export NVM_DIR="/root/.nvm"

if [ -s "$NVM_DIR/nvm.sh" ]; then
    . "$NVM_DIR/nvm.sh"
else
    echo "ERROR: NVM installation failed."
    exit 1
fi

# Install Node.js 16
nvm install 16
nvm use 16
nvm alias default 16

echo "Node version:"
node -v

echo "NPM version:"
npm -v

# Create application directory
mkdir -p /home/ec2-user/web

# Download application files from S3
aws s3 cp s3://yoousuph-terraform-netflix-files/webapp/web/ \
    /home/ec2-user/web/ \
    --recursive

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
aws s3 cp \
    s3://yoousuph-terraform-netflix-files/webapp/nginx.conf \
    /etc/nginx/nginx.conf

# Restart nginx
systemctl restart nginx

echo "========== USER DATA COMPLETED =========="