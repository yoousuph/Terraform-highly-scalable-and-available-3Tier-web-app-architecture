// ------------------------- VPC VARIABLES ------------------------
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


// ------------------------- REGION VARIABLES ------------------------
// REGION
variable "aws_region" {
  default = "us-east-1"
  type    = string
}

// --------------------------- AZ VARIABLES --------------------------
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


// -------------------- SUBNET VARIABLES -------------------------
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


// -------------------- GATEWAY VARIABLES ---------------------
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


// --------------------- ROUTE TABLE VARIABLES ----------------------
// PUBLIC ROUTE TABLE
variable "public_rt_name" {
  default = "Public Route Table"
  type    = string
}

// PUBLIC ROUTE TABLE CIDR
variable "public_rt_cidr" {
  type        = string
  description = "CIDR block to route taffic from internet gateway to anywhere"
  default     = "0.0.0.0/0"
}

// PRIVATE ROUTE TABLE
variable "private_rt_name" {
  default = "Private Route Table"
  type    = string
}

// PRIVATE ROUTE TABLE CIDR
variable "private_rt_cidr" {
  type        = string
  description = "CIDR block to route taffic from private subnet to natgateway"
  default     = "0.0.0.0/0"
}


//------------------ SECURITY GROUP VARIABLES ----------------------
// APPLICATION LOAD BALANCER SECURITY GROUP
variable "alb_sg_name" {
  type        = string
  description = "Name of the App Load Balancer security group"
  default     = "alb-sg"
}

// APPLICATION LOAD BALANCER SECURITY GROUP INBOUND RULE
variable "alb_sg_ingress_cidr_blocks" {
  type        = list(string)
  description = "List of CIDR blocks to allow inbound traffic to the App Load Balancer security group"
  default     = ["0.0.0.0/0"]
}

// APPLICATION LOAD BALANCER SECURITY GROUP OUTBOUND RULE
variable "alb_sg_egress_cidr_blocks" {
  type        = list(string)
  description = "List of CIDR blocks to allow outbound traffic from the App Load Balancer security group"
  default     = ["0.0.0.0/0"]
}

// AUTO SCALING GROUP SECURITY GROUP
variable "lt_sg_name" {
  type        = string
  description = "Name of the ASG security group"
  default     = "Security Group for ASG"
}

// LAUNCH TEMPLATE SECURITY GROUP FOR INBOUND RULE
variable "lt_sg_egress_cidr_blocks" {
  type        = list(string)
  description = "List of CIDR blocks to allow outbound traffic from the ASG security group"
  default     = ["0.0.0.0/0"]
}


// --------------- INSTANCES DHCP ENABLE VARIABLES -----------------
// INSTANCE AUTO ASSIGN IP
variable "auto_assign_ip" {
  default = "true"
  type    = bool
}


// ---------------- LAUNCH TEMPLATE VARIABLES -----------------
// LAUNCH TEMPLATE FOR AUTO SCALING GROUP
variable "lt_asg_name" {
  type        = string
  description = "Name of the Launch Template"
  default     = "lt-asg"
}

// LAUNCH TEMPLATE FOR AMAZON MACHINE IMAGE (AMI)
variable "lt_asg_ami" {
  type        = string
  description = "Amazon Linux 2 Ami ID"
  default     = "ami-06067086cf86c58e6"
}

// LAUNCH TEMPLATE FOR AUTOSCALLING GROUP INSTANCE TYPE
variable "lt_asg_instance_type" {
  type        = string
  description = "T2 Micro Instance Type"
  default     = "t2.micro"
}

// LAUNCH TEMPLATE FOR AUTOSCALLING GROUP KEY PAIR
variable "lt_asg_key" {
  type        = string
  description = "Key Pair"
  default     = "tatendaKeypair"
}


// ------------------- TARGET GROUP VARIABLES -----------------
// INSTANCES TARGET GROUP
variable "target_group_name" {
  type        = string
  description = "Name of the target group"
  default     = "alb-tg"
}


// ------------------------ PORT VARIABLES ---------------------
// HTTP TRAFFIC PORT NUMBER
variable "http_port" {
  type        = number
  description = "Port for HTTP traffic"
  default     = 80
}

// SSH TRAFFIC PORT NUMBER
variable "ssh_port" {
  type        = number
  description = "Port for SSH traffic"
  default     = 22
}


// --------------------- APPLICATION LOAD BALANCER VARIABLES -----------------
// APPLICATION LOAD BALANCER
variable "load_balancer_name" {
  type        = string
  description = "Name of the load balancer"
  default     = "pub-sub-alb"
}


// --------------------- AUTO SCALING GROUP VARIABLES ---------------------
// AUTO SCALING GROUP
variable "asg_name" {
  type        = string
  description = "Name of the ASG"
  default     = "ASG"
}

// AUTO SCALING GROUP MIN SIZE
variable "asg_min" {
  type        = number
  description = "ASG Min Size"
  default     = 2
}

// AUTO SCALING GROUP MAX SIZE
variable "asg_max" {
  type        = number
  description = "ASG Max Size"
  default     = 2
}

// AUTO SCALING GROUP DESIRED CAPACITY
variable "asg_des_cap" {
  type        = number
  description = "ASG Desired Capacity"
  default     = 2
}

