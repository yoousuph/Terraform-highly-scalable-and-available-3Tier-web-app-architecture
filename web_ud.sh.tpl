#!/bin/bash

# Use this for your user data (script from top to bottom)
exec > >(tee /var/log/user-data.log | logger -t user-data) 2>&1

# install Nginx on the Amazon Linux 2023
sudo dnf update -y

# Install Nginx
sudo dnf install nginx -y

# overwrite the default Nginx configuration with the provided template
cat <<EOF >/etc/nginx/nginx.conf
${nginx_conf}
EOF

# Start Nginx service
sudo systemctl start nginx

# Enable Nginx to start on boot
sudo systemctl enable nginx

# Copy the web files from the S3 bucket to the Nginx default directory
aws s3 cp s3://yoousuph-terraform-netflix-files/webapp/web/ /usr/share/nginx/html/ --recursive

# Restart Nginx to apply changes
sudo systemctl restart nginx


