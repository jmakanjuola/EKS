##__     ___    ____  ___    _    ____  _     _____
##\ \   / / \  |  _ \|_ _|  / \  | __ )| |   | ____|
###\ \ / / _ \ | |_) || |  / _ \ |  _ \| |   |  _|
####\ V / ___ \|  _ < | | / ___ \| |_) | |___| |___
#####\_/_/   \_\_| \_\___/_/   \_\____/|_____|_____|

# Earnest Dev ENV Region
variable "aws_region" {
  default     = "us-east-1"
  description = "Region"
}

variable "aws_access_key_id" {}
variable "aws_secret_key_id" {}

variable "aws_profile" {
  default = "e-development"
}

#Earnest Dev ENV Account #

variable "aws_account_id" {
  default = "747722821363"
}

variable "env" {
  default = "e-development"
}

variable "earnest-eks-vpc" {
  type = "map"

  default = {
    main                  = "10.100.0.0/16"
    eks-private-subnet-1a = "10.100.20.0/24"
    eks-private-subnet-1b = "10.100.21.0/24"
    eks-private-subnet-1c = "10.100.22.0/24"
    eks-public-subnet-1a  = "10.100.10.0/24"
    eks-public-subnet-1b  = "10.100.11.0/24"
    eks-public-subnet-1c  = "10.100.12.0/24"
  }
}

variable "external-ip" {
  default = "5.194.139.128/32"
}

variable "earnest-eks-nodes-defaults" {
  description = "Default values for target groups as defined by the list of maps."
  type        = "map"

  default = {
    name                 = "eks-nodes"    # Name for the eks workers.
    ami_id               = "ami-ba601bc2" # AMI "ami-dea4d5a1" ID for the eks workers. If none is provided, Terraform will searchfor the latest version of their EKS optimized worker AMI.
    asg_desired_capacity = "2"            # Desired worker capacity in the autoscaling group.
    asg_max_size         = "3"            # Maximum worker capacity in the autoscaling group.
    asg_min_size         = "2"            # Minimum worker capacity in the autoscaling group.
    instance_type        = "t2.small"     # Size of the workers instances.
    key_name             = "eks-key"      # The key name that should be used for the instances in the autoscaling group
    ebs_optimized        = false          # sets whether to use ebs optimization on supported types.
    public_ip            = false          # Associate a public ip address with a worker
  }
}

variable "earnest-eks-cluster-defaults" {
  description = "Default values for target groups as defined by the list of maps."
  type        = "map"

  default = {
    name = "eks-earnest-cluster" # Name for the eks cluster.
  }
}

variable "earnest-eks-cluster-name" {
  default = "earnest-eks"
  type    = "string"
}

variable "amis" {
  type = "map"

  default = {
    us-east-1 = "ami-759bc50a" #Distro 16:04 LTS instance. Type: hvm:ebs-ssd US-EAST-1
  }
}

variable "path_to_priv_key" {
  default = "eks-key"
}

variable "path_to_pub_key" {
  default = "eks-key.pub"
}

# Cloudtrail default variables
variable "trail_name" {
  default = "earnest-eks-cloud-trail"
  type    = "string"
}

variable "s3_bucket_name" {
  default = "earnest-eks-cloudtrail-bucket"
  type    = "string"
}

variable "is_multi_region_trail" {
  default = false
}

variable "include_global_service_events" {
  default = false
}
