#!/bin/bash
# Use this for your user data (script from top to bottom)
# install Nginx on the Amazon Linux 2023
sudo dnf update -y
sudo dnf install nginx -y
sudo systemctl start nginx
sudo systemctl enable nginx
echo "<h1> Hello! Up The Chels from $(hostname -f)</h1>" > /var/www/html/index.html