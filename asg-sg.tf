// PUBLIC SUBNET ASG LAUNCH TEMPLATE SECURITY GROUP
# Creating Security Group for ASG Launch Template
resource "aws_security_group" "pub_sub_asg_lt_sg" {
  name   = var.pub_sub_asg_lt_sg_name
  vpc_id = aws_vpc.three_tier_vpc.id

  # Inbound Rules
  # HTTP access from anywhere
  ingress {
    from_port       = var.pub_sub_http_port
    to_port         = var.pub_sub_http_port
    protocol        = "tcp"
    security_groups = [aws_security_group.pub_sub_alb_sg.id]
  }

  # SSH access from anywhere
  ingress {
    from_port       = var.pub_sub_ssh_port
    to_port         = var.pub_sub_ssh_port
    protocol        = "tcp"
    security_groups = [aws_security_group.pub_sub_alb_sg.id]
  }

  # Outbound Rules
  # Internet access to anywhere
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = var.pub_sub_asg_lt_sg_egress_cidr_blocks
  }
}

// PRIVATE SUBNET ASG LAUNCH TEMPLATE SECURITY GROUP
# Creating Security Group for ASG Launch Template
resource "aws_security_group" "priv_sub_asg_lt_sg" {
  name   = var.priv_sub_asg_lt_sg_name
  vpc_id = aws_vpc.three_tier_vpc.id

  # Inbound Rules
  # HTTP access from anywhere
  ingress {
    from_port       = var.priv_sub_http_port
    to_port         = var.priv_sub_http_port
    protocol        = "tcp"
    security_groups = [aws_security_group.priv_sub_alb_sg.id]
  }

  # SSH access from anywhere
  ingress {
    from_port       = var.priv_sub_ssh_port
    to_port         = var.priv_sub_ssh_port
    protocol        = "tcp"
    security_groups = [aws_security_group.priv_sub_alb_sg.id]
  }

  # Outbound Rules
  # Internet access to anywhere
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = var.priv_sub_asg_lt_sg_egress_cidr_blocks
  }
}