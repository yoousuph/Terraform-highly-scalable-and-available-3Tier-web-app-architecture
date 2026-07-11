resource "aws_security_group" "db_sg" {
  name        = var.db_sg_name
  description = "Identifier for the RDS database instance"
  vpc_id      = aws_vpc.three_tier_vpc.id

  ingress {
    from_port       = var.db_port
    to_port         = var.db_port
    protocol        = var.tcp_protocol
    security_groups = [aws_security_group.pub_sub_alb_sg.id]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = [var.db_egress_cidr]
  }
}

