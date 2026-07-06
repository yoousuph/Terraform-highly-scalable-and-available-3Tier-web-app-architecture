// PUBLIC SUBNET AUTOSCALING GROUP
# Create a launch template with the specified configurations
# resource "aws_launch_template" "pub-sub-asg-lt" {
#   name                   = var.pub_sub_asg_lt_name
#   image_id               = var.pub_sub_asg_lt_ami
#   instance_type          = var.pub_sub_asg_lt_instance_type
#   key_name               = var.pub_sub_asg_lt_key
#   vpc_security_group_ids = [aws_security_group.pub-sub-asg-lt-sg.id]
#   user_data              = filebase64("${path.root}/nginx-install.sh")
# }

resource "aws_launch_template" "pub-sub-asg-lt" {
  name                   = var.pub_sub_asg_lt_name
  image_id               = var.pub_sub_asg_lt_ami
  instance_type          = var.pub_sub_asg_lt_instance_type
  key_name               = var.pub_sub_asg_lt_key
  vpc_security_group_ids = [aws_security_group.pub-sub-asg-lt-sg.id]
  user_data              = filebase64("${path.root}/nginx-install.sh")

  iam_instance_profile {
    name = aws_iam_instance_profile.ec2_profile.name
  }
}

# Create an autoscaling group with the specified configurations
resource "aws_autoscaling_group" "pub-sub-asg" {
  name                = var.pub_sub_asg_name
  min_size            = var.pub_sub_asg_min
  max_size            = var.pub_sub_asg_max
  desired_capacity    = var.pub_sub_asg_des_cap
  vpc_zone_identifier = [aws_subnet.public-subnet1.id, aws_subnet.public-subnet2.id]

  launch_template {
    id = aws_launch_template.pub-sub-asg-lt.id
  }

  # Tag the autoscaling group for easier identification
  tag {
    key                 = "Name"
    value               = "Public Sub ASG"
    propagate_at_launch = true
  }
}

# Attach the autoscaling group to the target group of the ALB
resource "aws_autoscaling_attachment" "pub-sub-asg-tg-attach" {
  autoscaling_group_name = aws_autoscaling_group.pub-sub-asg.id
  lb_target_group_arn    = aws_lb_target_group.pub-sub-alb-tg.arn
}


// PRIVATE SUBNET AUTOSCALING GROUP
# Create a launch template with the specified configurations
# resource "aws_launch_template" "priv_sub_asg_lt" {
#   name                   = var.priv_sub_asg_lt_name
#   image_id               = var.priv_sub_asg_lt_ami
#   instance_type          = var.priv_sub_asg_lt_instance_type
#   key_name               = var.priv_sub_asg_lt_key
#   vpc_security_group_ids = [aws_security_group.priv-sub-asg-lt-sg.id]
#   user_data              = filebase64("${path.root}/nginx-install.sh")
# }

resource "aws_launch_template" "priv-sub-asg-lt" {
  name                   = var.priv_sub_asg_lt_name
  image_id               = var.priv_sub_asg_lt_ami
  instance_type          = var.priv_sub_asg_lt_instance_type
  key_name               = var.priv_sub_asg_lt_key
  vpc_security_group_ids = [aws_security_group.priv-sub-asg-lt-sg.id]
  user_data              = filebase64("${path.root}/nginx-install.sh")

  iam_instance_profile {
    name = aws_iam_instance_profile.ec2_profile.name
  }
}

# Create an autoscaling group with the specified configurations
resource "aws_autoscaling_group" "priv-sub-asg" {
  name             = var.priv_sub_asg_name
  min_size         = var.priv_sub_asg_min
  max_size         = var.priv_sub_asg_max
  desired_capacity = var.priv_sub_asg_des_cap
  vpc_zone_identifier = [
    aws_subnet.private-subnet1.id,
    aws_subnet.private-subnet2.id
  ]

  launch_template {
    id = aws_launch_template.priv-sub-asg-lt.id
  }

  # Tag the autoscaling group for easier identification
  tag {
    key                 = "Name"
    value               = "Private Sub ASG"
    propagate_at_launch = true
  }
}

# Attach the autoscaling group to the target group of the ALB
resource "aws_autoscaling_attachment" "priv-sub-asg-tg-attach" {
  autoscaling_group_name = aws_autoscaling_group.priv-sub-asg.id
  lb_target_group_arn    = aws_lb_target_group.priv-sub-alb-tg.arn
}