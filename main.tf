
# In order to create an EKS cluster using Terraform, users first need to configure the AWS provider.
# This can be done by adding the provider stanza to the Terraform configuration file.

# Specify the provider and access details


# ____  ____   _____     _____ ____  _____ ____
#|  _ \|  _ \ / _ \ \   / /_ _|  _ \| ____|  _ \
#| |_) | |_) | | | \ \ / / | || | | |  _| | |_) |
#|  __/|  _ <| |_| |\ V /  | || |_| | |___|  _ <
#|_|   |_| \_\\___/  \_/  |___|____/|_____|_| \_\

provider "aws" {
  region = "${var.region}"

}

# Using these data sources allows the configuration to be
# generic for any region.
data "aws_region" "current" {}

data "aws_availability_zones" "available" {}

provider "kubernetes" {
  config_context = "aws-test-terraform"
}
