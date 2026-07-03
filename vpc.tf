# Create an AWS VPC
resource "aws_vpc" "three-tier-vpc" {
  cidr_block       = var.vpc_cidr
  instance_tenancy = "default"

  tags = {
    Name = var.vpc_name
  }
}

# Create first public subnet in the VPC
resource "aws_subnet" "public-subnet1" {
  vpc_id                  = aws_vpc.three-tier-vpc.id
  cidr_block              = var.public_sub1_cidr
  availability_zone       = var.availability_zone-1
  map_public_ip_on_launch = true

  tags = {
    Name = var.public_sub1_name
  }
}

# Create second public subnet in the VPC
resource "aws_subnet" "public-subnet2" {
  vpc_id                  = aws_vpc.three-tier-vpc.id
  cidr_block              = var.public_sub2_cidr
  availability_zone       = var.availability_zone-2
  map_public_ip_on_launch = true

  tags = {
    Name = var.public_sub2_name
  }
}

# Create first private subnet in the VPC
resource "aws_subnet" "private-subnet1" {
  vpc_id                  = aws_vpc.three-tier-vpc.id
  cidr_block              = var.private_sub1_cidr
  availability_zone       = var.availability_zone-1
  map_public_ip_on_launch = true

  tags = {
    Name = var.private_sub1_name
  }
}

# Create second private subnet in the VPC
resource "aws_subnet" "private-subnet2" {
  vpc_id                  = aws_vpc.three-tier-vpc.id
  cidr_block              = var.private_sub2_cidr
  availability_zone       = var.availability_zone-2
  map_public_ip_on_launch = true

  tags = {
    Name = var.private_sub2_name
  }
}

# Create third private subnet in the VPC
resource "aws_subnet" "private-subnet3" {
  vpc_id                  = aws_vpc.three-tier-vpc.id
  cidr_block              = var.private_sub3_cidr
  availability_zone       = var.availability_zone-2
  map_public_ip_on_launch = true

  tags = {
    Name = var.private_sub3_name
  }
}

# Create fourth private subnet in the VPC
resource "aws_subnet" "private-subnet4" {
  vpc_id                  = aws_vpc.three-tier-vpc.id
  cidr_block              = var.private_sub4_cidr
  availability_zone       = var.availability_zone-2
  map_public_ip_on_launch = true

  tags = {
    Name = var.private_sub4_name
  }
}