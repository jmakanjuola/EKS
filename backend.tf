
"terraform" {
  backend "s3" {
    bucket = "eks-terraform-state"
    key    = "eks_terraform/terraform.tfstate"
    region = "us-west-2"
  }
}

