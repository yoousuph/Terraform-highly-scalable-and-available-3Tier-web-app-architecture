variable "aws_region" {
  default = "us-east-1"
  type    = string
}

variable "vpc_name" {
  default = "Three-Tier-VPC"
  type    = string
}

variable "availability_zone-1" {
  default = "us-east-1a"
  type    = string
}

variable "availability_zone-2" {
  default = "us-east-1b"
  type    = string
}

variable "auto_assign_ip" {
  default = "true"
  type    = bool
}

variable "public_sub1_name" {
  default = "Public Subnet 1"
  type    = string
}

variable "public_sub2_name" {
  default = "Public Subnet 2"
  type    = string
}

variable "private_sub1_name" {
  default = "Private Subnet 1"
  type    = string
}

variable "private_sub2_name" {
  default = "Private Subnet 2"
  type    = string
}
variable "private_sub3_name" {
  default = "Private Subnet 3"
  type    = string
}
variable "private_sub4_name" {
  default = "Private Subnet 4"
  type    = string
}

variable "igw_name" {
  default = "Internet Gatway"
  type    = string
}

variable "nat_gw_name" {
  default = "Nat Gateway"
  type    = string
}

variable "public_rt_name" {
  default = "Public Route Table"
  type    = string
}

variable "private_rt_name" {
  default = "Private Route Table"
  type    = string
}

variable "alb_sg_name" {
  type        = string
  description = "Name of the App Load Balancer security group"
  default     = "alb-sg"
}


variable "http_port" {
  type        = number
  description = "Port for HTTP traffic"
  default     = 80
}

variable "ssh_port" {
  type        = number
  description = "Port for SSH traffic"
  default     = 22
}

variable "alb_sg_ingress_cidr_blocks" {
  type        = list(string)
  description = "List of CIDR blocks to allow inbound traffic to the App Load Balancer security group"
  default     = ["0.0.0.0/0"]
}

variable "alb_sg_egress_cidr_blocks" {
  type        = list(string)
  description = "List of CIDR blocks to allow outbound traffic from the App Load Balancer security group"
  default     = ["0.0.0.0/0"]
}

variable "load_balancer_name" {
  type        = string
  description = "Name of the load balancer"
  default     = "pub-sub-alb"
}

variable "target_group_name" {
  type        = string
  description = "Name of the target group"
  default     = "alb-tg"
}

variable "lt_sg_name" {
  type        = string
  description = "Name of the ASG security group"
  default     = "Security Group for ASG"
}

variable "lt_sg_egress_cidr_blocks" {
  type        = list(string)
  description = "List of CIDR blocks to allow outbound traffic from the ASG security group"
  default     = ["0.0.0.0/0"]
}

variable "asg_name" {
  type        = string
  description = "Name of the ASG"
  default     = "ASG"
}

variable "lt_asg_name" {
  type        = string
  description = "Name of the Launch Template"
  default     = "lt-asg"
}

variable "lt_asg_ami" {
  type        = string
  description = "Amazon Linux 2 Ami ID"
  default     = "ami-0aa117785d1c1bfe5"
}

variable "lt_asg_instance_type" {
  type        = string
  description = "T2 Micro Instance Type"
  default     = "t2.micro"
}

variable "lt_asg_key" {
  type        = string
  description = "Key Pair"
  default     = "tatendaKeypair"
}

variable "asg_min" {
  type        = number
  description = "ASG Min Size"
  default     = 2
}

variable "asg_max" {
  type        = number
  description = "ASG Max Size"
  default     = 2
}

variable "asg_des_cap" {
  type        = number
  description = "ASG Desired Capacity"
  default     = 2
}

variable "public_rt_cidr" {
  type        = string
  description = "CIDR block to route taffic from internet gateway to anywhere"
  default     = "0.0.0.0/0"
}

variable "private_rt_cidr" {
  type        = string
  description = "CIDR block to route taffic from private subnet to natgateway"
  default     = "0.0.0.0/0"
}

variable "vpc_cidr" {
  default = "10.0.0.0/16"
  type    = string
}

variable "public_sub1_cidr" {
  default = "10.0.1.0/24"
  type    = string
}

variable "public_sub2_cidr" {
  default = "10.0.2.0/24"
  type    = string
}

variable "private_sub1_cidr" {
  default = "10.0.3.0/24"
  type    = string
}

variable "private_sub2_cidr" {
  default = "10.0.4.0/24"
  type    = string
}

variable "private_sub3_cidr" {
  default = "10.0.5.0/24"
  type    = string
}

variable "private_sub4_cidr" {
  default = "10.0.6.0/24"
  type    = string
}