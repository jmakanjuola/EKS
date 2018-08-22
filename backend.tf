<<<<<<< HEAD
# "terraform" {
#   backend "s3" {
#     bucket = "earnest-eks-state"
#     key    = "development1.8/terraform.tfstate"
#     region = "us-east-1"
#   }
#
#   tags {
#     Name = "earnest-eks-state"
#   }
# }

=======
"terraform" {
  backend "s3" {
    bucket = "eks-terraform-state"
    key    = "eks_terraform/terraform.tfstate"
    region = "us-west-2"
  }
}
>>>>>>> 5dc3eb4643346f9b444b0bb50ece321158145b55
