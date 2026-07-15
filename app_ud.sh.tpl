#!/bin/bash

# Switch to root user
sudo su

# Update system
dnf update -y

# Install required packages
dnf install -y nodejs mariadb105

# login to mysql
mysql -h ${rds_endpoint} -P ${db_port} -u ${db_username} -p ${db_password}

# create database
CREATE DATABASE appdb;

# use database
USE appdb;

# create table
CREATE TABLE IF NOT EXISTS transactions(
  id INT NOT NULL AUTO_INCREMENT, 
  amount DECIMAL(10,2), 
  description VARCHAR(100), 
  PRIMARY KEY(id)
);

# insert into table
INSERT INTO transactions (amount, description) VALUES ('7000', 'Furniture');
INSERT INTO transactions (amount, description) VALUES ('5000', 'Gadgets');

# exit mysql
exit;

# Create application directory
mkdir app

# Download backend files
aws s3 cp s3://yoousuph-terraform-netflix-files/app/ /home/ec2-user/app/ --recursive

# Change ownership
chown -R ec2-user:ec2-user /home/ec2-user/app

# Install dependencies
cd /home/ec2-user/app

# Install dependencies
npm install

# Install PM2
npm install -g pm2

# start the application with PM2
pm2 start index.js

# save the PM2 process list and corresponding environments
pm2 save
