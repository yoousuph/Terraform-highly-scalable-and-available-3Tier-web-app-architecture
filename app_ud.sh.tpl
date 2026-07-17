#!/bin/bash
set -euxo pipefail

# Log all output
exec > >(tee /var/log/user-data.log | logger -t user-data) 2>&1

echo "========== App Tier Setup Started =========="

#######################################
# Update packages
#######################################

dnf update -y

#######################################
# Install packages
#######################################

dnf install -y nodejs mariadb105

#######################################
# Verify installed versions
#######################################

node -v
npm -v
mysql --version

#######################################
# Wait until RDS is available
#######################################

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

#######################################
# Create database and table
#######################################

MYSQL_PWD="${db_password}" mysql \
    -h "${rds_address}" \
    -P "${rds_port}" \
    -u "${db_username}" <<EOF

CREATE DATABASE IF NOT EXISTS appdb;

USE appdb;

CREATE TABLE IF NOT EXISTS transactions (
    id INT AUTO_INCREMENT PRIMARY KEY,
    amount DECIMAL(10,2),
    description VARCHAR(100)
);

INSERT INTO transactions (amount, description)
VALUES (7000,'Furniture');

INSERT INTO transactions (amount, description)
VALUES (5000,'Gadgets');

EOF

echo "Database configured."

#######################################
# Create application directory
#######################################

mkdir -p /home/ec2-user/app

#######################################
# Download backend files
#######################################

aws s3 cp \
s3://yoousuph-terraform-netflix-files/app/ \
/home/ec2-user/app/ \
--recursive

#######################################
# Set ownership
#######################################

chown -R ec2-user:ec2-user /home/ec2-user/app

#######################################
# Install application
#######################################

cd /home/ec2-user/app

npm install

#######################################
# Install PM2
#######################################

npm install -g pm2

#######################################
# Start application
#######################################

su - ec2-user -c "
cd /home/ec2-user/app
pm2 start index.js --name my-api
pm2 save
"

echo "========== App Tier Setup Complete =========="

















# #!/bin/bash

# # Switch to root user
# sudo su

# # Update system
# dnf update -y

# # Install required packages
# dnf install -y nodejs mariadb105

# # login to mysql
# mysql -h "${rds_address}" -P "${db_port}" -u "${db_username}" -p"${db_password}"

# # create database
# CREATE DATABASE appdb;

# # use database
# USE appdb;

# # create table
# CREATE TABLE IF NOT EXISTS transactions(
#   id INT NOT NULL AUTO_INCREMENT, 
#   amount DECIMAL(10,2), 
#   description VARCHAR(100), 
#   PRIMARY KEY(id)
# );

# # insert into table
# INSERT INTO transactions (amount, description) VALUES ('7000', 'Furniture');
# INSERT INTO transactions (amount, description) VALUES ('5000', 'Gadgets');

# # exit mysql
# exit;

# # Create application directory
# mkdir app

# # Download backend files
# aws s3 cp s3://yoousuph-terraform-netflix-files/app/ /home/ec2-user/app/ --recursive

# # Change ownership
# chown -R ec2-user:ec2-user /home/ec2-user/app

# # Install dependencies
# cd /home/ec2-user/app

# # Install dependencies
# npm install

# # Install PM2
# npm install -g pm2

# # start the application with PM2
# pm2 start index.js

# # save the PM2 process list and corresponding environments
# pm2 save











