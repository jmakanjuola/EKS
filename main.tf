# In order to create an EKS cluster using Terraform, users first need to configure the AWS provider.
# This can be done by adding the provider stanza to the Terraform configuration file.

provider "aws" {
  #profile = "${var.aws_profile}"
  region = "${var.aws_region}"
}

# Specify the provider and access details
# provider "aws" {
#   region = "${var.region}"
# }

# Using these data sources allows the configuration to be
# generic for any region.
data "aws_region" "current" {}

data "aws_availability_zones" "available" {}

provider "kubernetes" {
  config_context = "aws-test-terraform"
}
