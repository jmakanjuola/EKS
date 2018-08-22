# # Spinnaker managing user
# resource "aws_iam_user" "eks-terraform" {
#   name = "eks-terraform"
#   path = "/"
# }
#
# resource "aws_iam_user_policy" "eks-terraform" {
#   name = "earnest-eks"
#   user = "${aws_iam_user.eks-terraform.name}"
#
#   policy = <<EOF
# {
#     "Version": "2012-10-17",
#     "Statement": [{
#         "Action": "sts:AssumeRole",
#         "Resource": [
#             "arn:aws:iam::${var.aws_account_id}:role/eks-terraform-managed"
#         ],
#         "Effect": "Allow"
#     }]
# }
# EOF
# }
#
# # EKS managed role
# resource "aws_iam_role" "eks-terraform" {
#   name = "eks-terraform"
#
#   assume_role_policy = <<EOF
# {
#   "Version": "2012-10-17",
#   "Statement": [
#     {
#       "Action": "sts:AssumeRole",
#       "Principal": {
#         "AWS": "${aws_iam_user.eks-terraform.arn}"
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

