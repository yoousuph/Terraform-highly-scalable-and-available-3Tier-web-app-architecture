resource "aws_db_instance" "db-instance" {
  identifier        = var.db_instance_identifier
  engine            = "mysql"
  engine_version    = "8.0"
  instance_class    = "db.t3.micro"
  allocated_storage = 20
  db_name           = var.db_name
  username          = var.db_username
  password          = var.db_password

  db_subnet_group_name   = aws_db_subnet_group.db-subnet-group.name
  vpc_security_group_ids = [aws_security_group.db-sg.id]

  publicly_accessible = false
  skip_final_snapshot = true

  tags = {
    Name = var.db_instance_identifier
  }
}

resource "aws_db_subnet_group" "db-subnet-group" {
  name = var.db_subnet_group_name
  subnet_ids = [
    aws_subnet.private-subnet3.id,
    aws_subnet.private-subnet4.id
  ]

  tags = {
    Name = var.db_subnet_group_name
  }
}