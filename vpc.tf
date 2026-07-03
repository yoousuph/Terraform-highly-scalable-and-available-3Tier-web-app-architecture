# Create an AWS VPC
resource "aws_vpc" "terraform-vpc" {
  cidr_block       = var.vpc_cidr
  instance_tenancy = "default"

  tags = {
    Name = var.vpc_name
  }
}

# Create first public subnet in the VPC
resource "aws_subnet" "pub-sub1" {
  vpc_id                  = aws_vpc.terraform-vpc.id
  cidr_block              = var.public_sub1_cidr
  availability_zone       = var.availability_zone-1
  map_public_ip_on_launch = true

  tags = {
    Name = var.public_sub1_name
  }
}

# Create second public subnet in the VPC
resource "aws_subnet" "pub-sub2" {
  vpc_id                  = aws_vpc.terraform-vpc.id
  cidr_block              = var.public_sub2_cidr
  availability_zone       = var.availability_zone-2
  map_public_ip_on_launch = true

  tags = {
    Name = var.public_sub2_name
  }
}

# Create first private subnet in the VPC
resource "aws_subnet" "priv-sub1" {
  vpc_id                  = aws_vpc.terraform-vpc.id
  cidr_block              = var.private_sub1_cidr
  availability_zone       = var.availability_zone-1
  map_public_ip_on_launch = true

  tags = {
    Name = var.private_sub1_name
  }
}

# Create second private subnet in the VPC
resource "aws_subnet" "priv-sub2" {
  vpc_id                  = aws_vpc.terraform-vpc.id
  cidr_block              = var.private_sub2_cidr
  availability_zone       = var.availability_zone-2
  map_public_ip_on_launch = true

  tags = {
    Name = var.private_sub2_name
  }
}

# Create second private subnet in the VPC
resource "aws_subnet" "priv-sub3" {
  vpc_id                  = aws_vpc.terraform-vpc.id
  cidr_block              = var.private_sub3_cidr
  availability_zone       = var.availability_zone-2
  map_public_ip_on_launch = true

  tags = {
    Name = var.private_sub3_name
  }
}

# Create second private subnet in the VPC
resource "aws_subnet" "priv-sub4" {
  vpc_id                  = aws_vpc.terraform-vpc.id
  cidr_block              = var.private_sub4_cidr
  availability_zone       = var.availability_zone-2
  map_public_ip_on_launch = true

  tags = {
    Name = var.private_sub4_name
  }
}