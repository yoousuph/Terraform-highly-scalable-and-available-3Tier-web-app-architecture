resource "aws_security_group" "db-sg" {
  name        = var.db_sg_name
  description = "Security group for RDS instance"
  vpc_id      = aws_vpc.three-tier-vpc.id

  ingress {
    from_port       = var.db_port
    to_port         = var.db_port
    protocol        = "tcp"
    security_groups = [aws_security_group.pub-sub-alb-sg.id]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = [var.db_egress_cidr]
  }
}
