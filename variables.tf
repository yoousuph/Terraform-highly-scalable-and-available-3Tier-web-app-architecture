// ---------------------------------- VPC VARIABLES ------------------------------
// VPC
variable "vpc_name" {
  default = "three-tier-vpc"
  type    = string
}

// VPC CIDR BLOCK
variable "vpc_cidr" {
  default = "10.0.0.0/16"
  type    = string
}


// ------------------------------- REGION VARIABLES ------------------------------
// REGION
variable "aws_region" {
  default = "us-east-1"
  type    = string
}

// -------------------------------- AZ VARIABLES ----------------------------------
// AVAILABILITY ZONE 1
variable "availability_zone-1" {
  default = "us-east-1a"
  type    = string
}

// AVAILABILITY ZONE 2
variable "availability_zone-2" {
  default = "us-east-1b"
  type    = string
}


// ------------------------------ SUBNET VARIABLES ----------------------------------
// PUBLIC SUBNET 1
variable "public_sub1_name" {
  default = "Public Subnet 1"
  type    = string
}

// PUBLIC SUBNET 1 CIDR BLOCK
variable "public_sub1_cidr" {
  default = "10.0.1.0/24"
  type    = string
}

// PUBLIC SUBNET 2
variable "public_sub2_name" {
  default = "Public Subnet 2"
  type    = string
}

// PUBLIC SUBNET 2 CIDR BLOCK
variable "public_sub2_cidr" {
  default = "10.0.2.0/24"
  type    = string
}

// PRIVATE SUBNET 1
variable "private_sub1_name" {
  default = "Private Subnet 1"
  type    = string
}

// PRIVATE SUBNET 1 CIDR BLOCK
variable "private_sub1_cidr" {
  default = "10.0.3.0/24"
  type    = string
}

// PRIVATE SUBNET 2
variable "private_sub2_name" {
  default = "Private Subnet 2"
  type    = string
}

// PRIVATE SUBNET 2 CIDR BLOCK
variable "private_sub2_cidr" {
  default = "10.0.4.0/24"
  type    = string
}

// PRIVATE SUBNET 3
variable "private_sub3_name" {
  default = "Private Subnet 3"
  type    = string
}

// PRIVATE SUBNET 3 CIDR BLOCK
variable "private_sub3_cidr" {
  default = "10.0.5.0/24"
  type    = string
}

// PRIVATE SUBNET 4
variable "private_sub4_name" {
  default = "Private Subnet 4"
  type    = string
}

// PRIVATE SUBNET 4 CIDR BLOCK
variable "private_sub4_cidr" {
  default = "10.0.6.0/24"
  type    = string
}


// ----------------------------- GATEWAY VARIABLES ------------------------------
// INTERNET GATEWAY
variable "igw_name" {
  default = "Internet Gatway"
  type    = string
}

// NAT GATEWAY
variable "nat_gw_name" {
  default = "Nat Gateway"
  type    = string
}

// NAT GATEWAY EIP
variable "nat_eip_name" {
  default = "ngw-eip"
  type    = string
}


// ------------------------- ROUTE TABLE VARIABLES -----------------------------
// PUBLIC ROUTE TABLE (NAME, CIDR,)
variable "public_rt_name" {
  default = "Public Route Table"
  type    = string
}

variable "public_rt_cidr" {
  type        = string
  description = "CIDR block to route taffic from internet gateway to anywhere"
  default     = "0.0.0.0/0"
}

// PRIVATE ROUTE TABLE (NAME & CIDR)
variable "private_rt_name" {
  default = "Private Route Table"
  type    = string
}

variable "private_rt_cidr" {
  type        = string
  description = "CIDR block to route taffic from private subnet to natgateway"
  default     = "0.0.0.0/0"
}


//--------------------------- SECURITY GROUP VARIABLES -------------------------------
// PUBLIC ALB SECURITY GROUP (NAME, INBOUND, & OUTBOUND)
variable "pub_sub_alb_sg_name" {
  type        = string
  description = "Name of the public alb security group"
  default     = "public-sub-alb-sg"
}

variable "pub_sub_alb_sg_ingress_cidr_blocks" {
  type        = list(string)
  description = "List of CIDR blocks to allow inbound traffic to the App Load Balancer security group"
  default     = ["0.0.0.0/0"]
}

variable "pub_sub_alb_sg_egress_cidr_blocks" {
  type        = list(string)
  description = "List of CIDR blocks to allow outbound traffic from the App Load Balancer security group"
  default     = ["0.0.0.0/0"]
}

// PUBLIC LT FOR ASG SECURITY GROUP (NAME, INBOUND, & OUTBOUND)
variable "pub_sub_asg_lt_sg_name" {
  type        = string
  description = "Name of the ASG security group for public subnet"
  default     = "asg Security Group for public subnet"
}

variable "pub_sub_asg_lt_sg_ingress_cidr_blocks" {
  type        = list(string)
  description = "List of CIDR blocks to allow outbound traffic from the ASG security group"
  default     = ["0.0.0.0/0"]
}

variable "pub_sub_asg_lt_sg_egress_cidr_blocks" {
  type        = list(string)
  description = "List of CIDR blocks to allow outbound traffic from the ASG security group"
  default     = ["0.0.0.0/0"]
}

// PRIVATE ALB SECURITY GROUP (NAME, INBOUND, & OUTBOUND)
variable "priv_sub_alb_sg_name" {
  type        = string
  description = "Name of the private alb security group"
  default     = "private-sub-alb-sg"
}

variable "priv_sub_alb_sg_ingress_cidr_blocks" {
  type        = list(string)
  description = "List of CIDR blocks to allow inbound traffic to the App Load Balancer security group"
  default     = ["0.0.0.0/0"]
}

variable "priv_sub_alb_sg_egress_cidr_blocks" {
  type        = list(string)
  description = "List of CIDR blocks to allow outbound traffic from the App Load Balancer security group"
  default     = ["0.0.0.0/0"]
}

// PRIVATE LT FOR ASG SECURITY GROUP (NAME, INBOUND, & OUTBOUND)
variable "priv_sub_asg_lt_sg_name" {
  type        = string
  description = "Name of the ASG security group for private subnet"
  default     = "asg Security Group for private subnet"
}

variable "priv_sub_asg_lt_sg_ingress_cidr_blocks" {
  type        = list(string)
  description = "List of CIDR blocks to allow outbound traffic from the ASG security group"
  default     = ["0.0.0.0/0"]
}

variable "priv_sub_asg_lt_sg_egress_cidr_blocks" {
  type        = list(string)
  description = "List of CIDR blocks to allow outbound traffic from the ASG security group"
  default     = ["0.0.0.0/0"]
}

// RDS DATABASE SECURITY GROUP (NAME, PORT, INBOUND, & OUTBOUND)
variable "db_sg_name" {
  type        = string
  description = "Name of the RDS database security group"
  default     = "mydb-subnet-group-sg"
}
variable "db_port" {
  type        = number
  description = "Port for the RDS database"
  default     = 3306
}

variable "db_ingress_cidr" {
  type        = string
  description = "CIDR block to allow inbound traffic to the RDS database security group"
  default     = "0.0.0.0/0"
}

variable "db_egress_cidr" {
  type        = string
  description = "CIDR block to allow outbound traffic from the RDS database security group"
  default     = "0.0.0.0/0"
}


// --------------------------- TARGET GROUP VARIABLES ----------------------------
// INSTANCES TARGET GROUP
variable "pub_target_group_name" {
  type        = string
  description = "Name of the public subnet target group"
  default     = "pub-sub-alb-tg"
}

variable "priv_target_group_name" {
  type        = string
  description = "Name of the private subnet target group"
  default     = "priv-sub-alb-tg"
}


// --------------------------- APPLICATION LOAD BALANCER VARIABLES ---------------------
// PUBLIC APPLICATION LOAD BALANCER
variable "pub_load_balancer_name" {
  type        = string
  description = "Name of the load balancer"
  default     = "public-subnet-alb"
}

// PRIVATE APPLICATION LOAD BALANCER
variable "priv_load_balancer_name" {
  type        = string
  description = "Name of the load balancer"
  default     = "private-subnet-alb"
}


// --------------------- LAUNCH TEMPLATE VARIABLES --------------------------
// PUBLIC SUBNET LT FOR ASG (NAME, AMI, & INSTANCE-TYPE)
variable "pub_sub_asg_lt_name" {
  type        = string
  description = "Name of the Launch Template"
  default     = "public-subnet-asg-lt"
}

variable "pub_sub_asg_lt_ami" {
  type        = string
  description = "Amazon Linux 2 Ami ID"
  default     = "ami-06067086cf86c58e6"
}

variable "pub_sub_asg_lt_instance_type" {
  type        = string
  description = "T2 Micro Instance Type"
  default     = "t2.micro"
}

// PUBLIC SUBNET LT FOR ASG (NAME, AMI, & INSTANCE-TYPE)
variable "priv_sub_asg_lt_name" {
  type        = string
  description = "Name of the Launch Template"
  default     = "private-subnet-asg-lt"
}

variable "priv_sub_asg_lt_ami" {
  type        = string
  description = "Amazon Linux 2 Ami ID"
  default     = "ami-06067086cf86c58e6"
}

variable "priv_sub_asg_lt_instance_type" {
  type        = string
  description = "T2 Micro Instance Type"
  default     = "t2.micro"
}


// ------------------------ INSTANCES PROFILE VARIABLES ---------------------
variable "iam_instance_profile_name" {
  type        = string
  description = "Name of the IAM instance profile for EC2 instances"
  default     = "ec2-s3-readonly-profile"
}


// ------------------------ INSTANCES DHCP ENABLE VARIABLES ---------------------
// INSTANCE AUTO ASSIGN IP
variable "auto_assign_ip" {
  default = "true"
  type    = bool
}


// ------------------------ AUTO SCALING GROUP VARIABLES -----------------------
// PBLIC AUTO SCALING GROUP (NAME, MIN, MAX, & DESIRED CAPACITY)
variable "pub_sub_asg_name" {
  type        = string
  description = "Name of the public subnet ASG"
  default     = "pub_sub_asg"
}

variable "pub_sub_asg_min" {
  type        = number
  description = "ASG Min Size"
  default     = 2
}

variable "pub_sub_asg_max" {
  type        = number
  description = "ASG Max Size"
  default     = 2
}
variable "pub_sub_asg_des_cap" {
  type        = number
  description = "ASG Desired Capacity"
  default     = 2
}

// PRIVATE AUTO SCALING GROUP (NAME, MIN, MAX, & DESIRED CAPACITY)
variable "priv_sub_asg_name" {
  type        = string
  description = "Name of the private subnet ASG"
  default     = "priv_sub_asg"
}

variable "priv_sub_asg_min" {
  type        = number
  description = "ASG Min Size"
  default     = 2
}

variable "priv_sub_asg_max" {
  type        = number
  description = "ASG Max Size"
  default     = 2
}

variable "priv_sub_asg_des_cap" {
  type        = number
  description = "ASG Desired Capacity"
  default     = 2
}


// ------------------------- RDS DATABASE VARIABLES ----------------------------
variable "db_instance_identifier" {
  type        = string
  description = "Identifier for the RDS database instance"
  default     = "mydb-instance"
}

variable "db_name" {
  type        = string
  description = "Name of the RDS database"
  default     = "mydb"
}

variable "db_username" {
  type        = string
  description = "Username for the RDS database"
  default     = "admin"
}

variable "db_password" {
  type        = string
  description = "Password for the RDS database"
  default     = "yusrds58"
}

variable "db_allocated_storage" {
  type        = number
  description = "Allocated storage for the RDS database in GB"
  default     = 20
}

variable "db_storage_type" {
  type        = string
  description = "Storage type for the RDS database"
  default     = "gp2"
}

variable "db_storage_encrypted" {
  type        = string
  description = "Encryption for storage"
  default     = true
}

variable "db_engine" {
  type        = string
  description = "Database engine for the RDS database"
  default     = "mysql"
}

variable "db_engine_version" {
  type        = string
  description = "Database engine version for the RDS database"
  default     = "8.0"
}

variable "db_instance_class" {
  type        = string
  description = "Instance class for the RDS database"
  default     = "db.t3.micro"
}

// ------------------------- RDS DATABASE SUBNET GROUP VARIABLES ---------------------------
// RDS DATABASE SUBNET GROUP (NAME & DESCRIPTION)
variable "db_subnet_group_name" {
  type        = string
  description = "Name of the RDS database subnet group"
  default     = "mydb-subnet-group"
}


// ---------------------------- PORT VARIABLES ---------------------------
// PUBLIC SUBNET TRAFFIC PORTS (HTTP AND SSH)
variable "pub_sub_http_port" {
  type        = number
  description = "Port for HTTP traffic in the public subnet"
  default     = 80
}

variable "pub_sub_ssh_port" {
  type        = number
  description = "Port for SSH traffic in the public subnet"
  default     = 22
}

variable "tcp_protocol" {
  type        = string
  description = "TCP Protocol for resource"
  default     = "tcp"
}

variable "http_protocol" {
  type        = string
  description = "HTTP protocol for resource"
  default     = "HTTP"
}

// PRIVATE SUBNET TRAFFIC PORTS (HTTP AND SSH)
variable "priv_sub_http_port" {
  type        = number
  description = "Port for HTTP traffic in the private subnet"
  default     = 4000
}

variable "priv_sub_ssh_port" {
  type        = number
  description = "Port for SSH traffic in the private subnet"
  default     = 22
}

// PRIVATE SUBNET TRAFFIC PORTS FOR DATABASE (HTTP AND SSH)
variable "priv_db_sub_mysql_port" {
  type        = number
  description = "Port for HTTP traffic in the private subnet"
  default     = 3306
}


// ------------------------ KEY PAIR VARIABLES -----------------------
variable "three_tier_pub_key" {
  type        = string
  description = "Key Pair"
  default     = "three-tier-kp"
}


// --------------------- IAM ROLE VARIABLES ---------------------
variable "iam_role_name" {
  type        = string
  description = "Name of the IAM role for EC2 instances"
  default     = "ec2-s3-readonly-role"
}