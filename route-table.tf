# Creates a public route table with a default route to the internet gateway
resource "aws_route_table" "pub-rt" {
  vpc_id = aws_vpc.three-tier-vpc.id

  # Create a default route for the internet gateway with destination 0.0.0.0/0
  route {
    cidr_block = var.public_rt_cidr
    gateway_id = aws_internet_gateway.vpc-igw.id
  }

  tags = {
    Name = var.public_rt_name
  }
}

# Creates a private route table with a default route to the NAT gateway
resource "aws_route_table" "priv-rt" {
  vpc_id = aws_vpc.three-tier-vpc.id

  route {
    cidr_block = var.private_rt_cidr
    gateway_id = aws_nat_gateway.vpc-ngw.id
  }

  tags = {
    Name = var.private_rt_name
  }
}

# Associates the public route table with the public subnet 1
resource "aws_route_table_association" "pub-sub1-rt-ass" {
  subnet_id      = aws_subnet.public-subnet1.id
  route_table_id = aws_route_table.pub-rt.id
}

# Associates the public route table with the public subnet 2
resource "aws_route_table_association" "pub-sub2-rt-ass" {
  subnet_id      = aws_subnet.public-subnet2.id
  route_table_id = aws_route_table.pub-rt.id
}

# Associates the private route table with the private subnet 1
resource "aws_route_table_association" "priv-sub1-rt-ass" {
  subnet_id      = aws_subnet.private-subnet1.id
  route_table_id = aws_route_table.priv-rt.id

  # Wait for the private route table to be created before creating this association
  depends_on = [aws_route_table.priv-rt]
}

# Associates the private route table with the private subnet 2
resource "aws_route_table_association" "priv-sub2-rt-ass" {
  subnet_id      = aws_subnet.private-subnet2.id
  route_table_id = aws_route_table.priv-rt.id

  # Wait for the private route table to be created before creating this association
  depends_on = [aws_route_table.priv-rt]
}
# Associates the private route table with the private subnet 3
resource "aws_route_table_association" "priv-sub3-rt-ass" {
  subnet_id      = aws_subnet.private-subnet3.id
  route_table_id = aws_route_table.priv-rt.id

  # Wait for the private route table to be created before creating this association
  depends_on = [aws_route_table.priv-rt]
}
# Associates the private route table with the private subnet 4
resource "aws_route_table_association" "priv-sub4-rt-ass" {
  subnet_id      = aws_subnet.private-subnet4.id
  route_table_id = aws_route_table.priv-rt.id

  # Wait for the private route table to be created before creating this association
  depends_on = [aws_route_table.priv-rt]
}
