#!/bin/bash

set -euxo pipefail

# Log all output
exec > >(tee /var/log/user-data.log | logger -t user-data) 2>&1
echo "========== App Tier Setup Started =========="

# Update packages
dnf update -y

# install nodejs and mysql
dnf install -y nodejs mariadb105

# Wait until RDS is available
echo "Waiting for RDS..."

until mysqladmin \
    -h "${rds_address}" \
    -P "${rds_port}" \
    -u "${db_username}" \
    -p"${db_password}" \
    ping --silent
do
    echo "RDS not ready..."
    sleep 10
done

echo "RDS is ready."

# Login to RDS instance and create database
MYSQL_PWD="${db_password}" mysql \
    -h "${rds_address}" \
    -P "${rds_port}" \
    -u "${db_username}" <<EOF

CREATE DATABASE IF NOT EXISTS ${db_name};
USE ${db_name};
CREATE TABLE IF NOT EXISTS transaction (
    id INT AUTO_INCREMENT PRIMARY KEY,
    amount DECIMAL(10,2),
    description VARCHAR(100)
);
INSERT INTO transaction (amount, description) VALUES (7000,'Furniture');
INSERT INTO transaction (amount, description) VALUES (5000,'Gadgets');
EOF

echo "Database configured."

# Create application directory
mkdir -p /home/ec2-user/app

# Download backend files
aws s3 cp s3://yoousuph-terraform-netflix-files/app/ /home/ec2-user/app/ --recursive

# Set ownership
chown -R ec2-user:ec2-user /home/ec2-user/app

# Install application
cd /home/ec2-user/app
npm install

# Install PM2
npm install -g pm2

# Start application
su - ec2-user -c "
cd /home/ec2-user/app
pm2 start index.js --name my-api
pm2 save
"

echo "========== App Tier Setup Complete =========="







