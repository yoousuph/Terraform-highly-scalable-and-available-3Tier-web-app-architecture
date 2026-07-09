# Output
output "three-tier-vpc-id" {
  value = aws_vpc.three-tier-vpc.id
}

output "public-subnet1-id" {
  value = aws_subnet.public-subnet1.id
}

output "public-subnet2-id" {
  value = aws_subnet.public-subnet2.id
}

output "private-subnet1-id" {
  value = aws_subnet.private-subnet1.id
}

output "private-subnet2-id" {
  value = aws_subnet.private-subnet2.id
}

output "private-subnet3-id" {
  value = aws_subnet.private-subnet3.id
}

output "private-subnet4-id" {
  value = aws_subnet.private-subnet4.id
}

output "vpc-igw-id" {
  value = aws_internet_gateway.vpc-igw.id
}

output "pub-alb-dns-name" {
  value = aws_lb.pub-sub-alb.dns_name
}

output "priv-alb-dns-name" {
  value = aws_lb.priv-sub-alb.dns_name
}