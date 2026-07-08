#!/bin/bash
# Use this for your user data (script from top to bottom)

# install Nginx on the Amazon Linux 2023
sudo dnf update -y


sudo dnf install nginx -y


sudo systemctl start nginx


sudo systemctl enable nginx


aws s3 cp s3://yoousuph-terraform-netflix-files/webapp/web/ /usr/share/nginx/html/ --recursive


sudo systemctl restart nginx
