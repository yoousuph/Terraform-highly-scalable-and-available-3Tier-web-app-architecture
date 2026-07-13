#!/bin/bash

# Use this for your user data (script from top to bottom)
exec > >(tee /var/log/user-data.log | logger -t user-data) 2>&1

# install Nginx on the Amazon Linux 2023
sudo dnf update -y

# Install Nginx
sudo dnf install nginx -y

# install nvm
curl -o- https://raw.githubusercontent.com/yoousuph/aws_3tier_architecture/main/install.sh | bash
source ~/.bashrc
nvm install 16
nvm use 16

# Remove all default nnginx UI files
sudo rm -rf /usr/share/nginx/html/

# Copy the web files from the S3 bucket to the Nginx default directory
aws s3 cp s3://yoousuph-terraform-netflix-files/webapp/web/ /usr/share/nginx/html/ --recursive

# Remove the nginx.conf file
sudo rm -rf /usr/share/nginx/html/

# copy nginx.conf file to server
aws s3 cp s3://yoousuph-terraform-netflix-files/webapp/nginx.conf /etc/nginx/nginx.conf --recursive

# go into the project folder
cd /usr/share/nginx/html/

# install node js
npm install

# run build
npm run build

# Start Nginx service
sudo systemctl start nginx

# Enable Nginx to start on boot
sudo systemctl enable nginx

# Restart Nginx to apply changes
sudo systemctl restart nginx


