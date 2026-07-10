// PUBLIC SUBNETS - ALB
# Create a new load balancer - ALB for public subnets
resource "aws_lb" "pub_sub_alb" {
  name = var.pub_load_balancer_name
  subnets = [
    aws_subnet.public_subnet1.id,
    aws_subnet.public_subnet2.id
  ]

  security_groups = [
    aws_security_group.pub_sub_alb_sg.id
  ]

  depends_on = [
    aws_lb_target_group.pub_sub_alb_tg
  ]

  tags = {
    Name = var.pub_load_balancer_name
  }

}

# Create a target group for the load balancer
resource "aws_lb_target_group" "pub_sub_alb_tg" {
  name     = var.pub_target_group_name
  port     = 80
  protocol = "HTTP"
  vpc_id   = aws_vpc.three_tier_vpc.id

  # Set the health check configuration for the target group
  health_check {
    interval = 60
    path     = "/health"
    port     = 80
    timeout  = 45
    protocol = "HTTP"
    matcher  = "200,202"
  }
}

# Create ALB listener
resource "aws_lb_listener" "pub_sub_alb_listener" {
  load_balancer_arn = aws_lb.pub_sub_alb.arn
  port              = "80"
  protocol          = "HTTP"

  # Set the default action for the listener
  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.pub_sub_alb_tg.arn
  }
}


// PRIVATE SUBNETS - ALB
# Create a new load balancer - ALB for private subnets
resource "aws_lb" "priv_sub_alb" {
  name = var.priv_load_balancer_name
  subnets = [
    aws_subnet.private_subnet1.id,
    aws_subnet.private_subnet2.id
  ]

  internal = true

  security_groups = [
    aws_security_group.priv_sub_alb_sg.id
  ]

  depends_on = [
    aws_lb_target_group.priv_sub_alb_tg
  ]

  tags = {
    Name = var.priv_load_balancer_name
  }

}

# Create a target group for the load balancer
resource "aws_lb_target_group" "priv_sub_alb_tg" {
  name     = var.priv_target_group_name
  port     = 3000
  protocol = "HTTP"
  vpc_id   = aws_vpc.three_tier_vpc.id

  # Set the health check configuration for the target group
  health_check {
    interval = 60
    path     = "/health"
    port     = 3000
    timeout  = 45
    protocol = "HTTP"
    matcher  = "200,202"
  }
}

# Create ALB listener
resource "aws_lb_listener" "priv_sub_alb_listener" {
  load_balancer_arn = aws_lb.priv_sub_alb.arn
  port              = "3000"
  protocol          = "HTTP"

  # Set the default action for the listener
  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.priv_sub_alb_tg.arn
  }
}