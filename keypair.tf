# RSA key of size 4096 bits
resource "tls_private_key" "rsa_key_type" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

// public key for private subnet instance
resource "aws_key_pair" "pub_key" {
  key_name   = var.pub_key_asg_lt
  public_key = tls_private_key.rsa_key_type.public_key_openssh
}

// local key for private subnet instance
resource "local_file" "local_key" {
  filename        = var.local_key_asg_lt
  content         = tls_private_key.rsa_key_type.private_key_pem
  file_permission = "0400"
}