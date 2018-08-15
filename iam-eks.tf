# # Spinnaker managing user
# resource "aws_iam_user" "EKS-Terraform" {
#   name = "EKS-Terraform"
#   path = "/"
# }
#
# resource "aws_iam_user_policy" "EKS-Terraform" {
#   name = "EKS-Terraform"
#   user = "${aws_iam_user.EKS-Terraform.name}"
#
#   policy = <<EOF
# {
#     "Version": "2012-10-17",
#     "Statement": [{
#         "Action": "sts:AssumeRole",
#         "Resource": [
#             "arn:aws:iam::${var.aws_account_id}:role/EKS-Terraform-managed"
#         ],
#         "Effect": "Allow"
#     }]
# }
# EOF
# }
#
# # EKS managed role
# resource "aws_iam_role" "EKS-Terraform" {
#   name = "EKS-Terraform"
#
#   assume_role_policy = <<EOF
# {
#   "Version": "2012-10-17",
#   "Statement": [
#     {
#       "Action": "sts:AssumeRole",
#       "Principal": {
#         "AWS": "${aws_iam_user.EKS-Terraform.arn}"
#       },
#       "Effect": "Allow",
#       "Sid": ""
#     }
#   ]
# }
# EOF
# }
#
# # base ec2 iam role
# resource "aws_iam_role" "base-iam-role" {
#   name = "BaseIAMRole"
#
#   assume_role_policy = <<EOF
# {
#   "Version": "2012-10-17",
#   "Statement": [
#     {
#       "Action": "sts:AssumeRole",
#       "Principal": {
#         "Service": "ec2.amazonaws.com"
#       },
#       "Effect": "Allow",
#       "Sid": ""
#     }
#   ]
# }
# EOF
# }
#
# resource "aws_iam_instance_profile" "base-iam-role" {
#   name = "BaseIAMRole"
#   role = "${aws_iam_role.base-iam-role.name}"
# }
