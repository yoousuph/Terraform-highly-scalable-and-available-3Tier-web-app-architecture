
# // 1. IAM Role
# resource "aws_iam_role" "ec2_role" {
#   name = "asg-ec2-role"

#   assume_role_policy = jsonencode({
#     Version = "2012-10-17"
#     Statement = [
#       {
#         Effect = "Allow"
#         Principal = {
#           Service = "ec2.amazonaws.com"
#         }
#         Action = "sts:AssumeRole"
#       }
#     ]
#   })
# }
# //2. Attach the AWS Managed Policy
# resource "aws_iam_role_policy_attachment" "s3_readonly" {
#   role       = aws_iam_role.ec2_role.name
#   policy_arn = "arn:aws:iam::aws:policy/AmazonS3ReadOnlyAccess"
# }

# // 3. Create an Instance Profile
# // EC2 instances can't use an IAM role directly—they require an instance profile.

# resource "aws_iam_instance_profile" "ec2_profile" {
#   name = "asg-ec2-profile"
#   role = aws_iam_role.ec2_role.name
# }

# // 4. Use the Instance Profile in the Launch Template
# resource "aws_launch_template" "example" {
#   name_prefix   = "web-"
#   image_id      = "ami-xxxxxxxx"
#   instance_type = "t3.micro"

#   iam_instance_profile {
#     name = aws_iam_instance_profile.ec2_profile.name
#   }
# }

# // 5. Reference the Launch Template in the Auto Scaling Group
# resource "aws_autoscaling_group" "example" {
#   desired_capacity = 2
#   min_size         = 2
#   max_size         = 4

#   vpc_zone_identifier = [
#     aws_subnet.private_a.id,
#     aws_subnet.private_b.id,
#   ]

#   launch_template {
#     id      = aws_launch_template.example.id
#     version = "$Latest"
#   }
# }
