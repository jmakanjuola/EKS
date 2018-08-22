##__     ___    ____  ___    _    ____  _     _____
##\ \   / / \  |  _ \|_ _|  / \  | __ )| |   | ____|
###\ \ / / _ \ | |_) || |  / _ \ |  _ \| |   |  _|
####\ V / ___ \|  _ < | | / ___ \| |_) | |___| |___
#####\_/_/   \_\_| \_\___/_/   \_\____/|_____|_____|

<<<<<<< HEAD
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

=======
variable "region" {
  default     = "us-west-2"
  description = "Region"
}

# Earnest Dev ENV Region
# variable "aws_region" {
#   default = "us-east-1"
# }

variable "vpc" {
  type = "map"

  default = {
    main                  = "10.100.0.0/16"
    eks-private-subnet-2a = "10.100.20.0/24"
    eks-private-subnet-2b = "10.100.21.0/24"
    eks-private-subnet-2c = "10.100.22.0/24"
    eks-public-subnet-2a  = "10.100.10.0/24"
    eks-public-subnet-2b  = "10.100.11.0/24"
    eks-public-subnet-2c  = "10.100.12.0/24"
  }
}

# Earnest Dev ENV Account #
variable "aws_account_id" {
  #   #  default = "747722821363" # Earnest Dev ENV
  default = "511491726667"
}

# # Earnest Dev ENV Profile
# variable "aws_profile" {
#   default = "e-development-Operations"
# }

>>>>>>> 5dc3eb4643346f9b444b0bb50ece321158145b55
variable "env" {
  default = "e-development"
}

<<<<<<< HEAD
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

=======
>>>>>>> 5dc3eb4643346f9b444b0bb50ece321158145b55
variable "external-ip" {
  default = "5.194.139.128/32"
}

<<<<<<< HEAD
variable "earnest-eks-nodes-defaults" {
=======
variable "nodes_defaults" {
>>>>>>> 5dc3eb4643346f9b444b0bb50ece321158145b55
  description = "Default values for target groups as defined by the list of maps."
  type        = "map"

  default = {
    name                 = "eks-nodes"    # Name for the eks workers.
<<<<<<< HEAD
    ami_id               = "ami-ba601bc2" # AMI "ami-dea4d5a1" ID for the eks workers. If none is provided, Terraform will searchfor the latest version of their EKS optimized worker AMI.
=======
    ami_id               = "ami-ba602bc2" # AMI "ami-dea4d5a1" ID for the eks workers. If none is provided, Terraform will searchfor the latest version of their EKS optimized worker AMI.
>>>>>>> 5dc3eb4643346f9b444b0bb50ece321158145b55
    asg_desired_capacity = "2"            # Desired worker capacity in the autoscaling group.
    asg_max_size         = "3"            # Maximum worker capacity in the autoscaling group.
    asg_min_size         = "2"            # Minimum worker capacity in the autoscaling group.
    instance_type        = "t2.small"     # Size of the workers instances.
    key_name             = "eks-key"      # The key name that should be used for the instances in the autoscaling group
    ebs_optimized        = false          # sets whether to use ebs optimization on supported types.
    public_ip            = false          # Associate a public ip address with a worker
  }
}

<<<<<<< HEAD
variable "earnest-eks-cluster-defaults" {
=======
variable "cluster_defaults" {
>>>>>>> 5dc3eb4643346f9b444b0bb50ece321158145b55
  description = "Default values for target groups as defined by the list of maps."
  type        = "map"

  default = {
<<<<<<< HEAD
    name = "eks-earnest-cluster" # Name for the eks cluster.
  }
}

variable "earnest-eks-cluster-name" {
  default = "earnest-eks"
=======
    name = "eks-cluster" # Name for the eks cluster.
  }
}

variable "cluster-name" {
  default = "terraform-eks-demo"
>>>>>>> 5dc3eb4643346f9b444b0bb50ece321158145b55
  type    = "string"
}

variable "amis" {
  type = "map"

  default = {
<<<<<<< HEAD
    us-east-1 = "ami-759bc50a" #Distro 16:04 LTS instance. Type: hvm:ebs-ssd US-EAST-1
=======
    us-west-2 = "ami-ba602bc2" #Distro 16:04 LTS instance. Type: hvm:ebs-ssd US-WEST-1
>>>>>>> 5dc3eb4643346f9b444b0bb50ece321158145b55
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
<<<<<<< HEAD
=======

#
# variable "cluster_name" {
#   default = "earnest-eks-cluster-cloudtrail"
#   type    = "string"
# }
>>>>>>> 5dc3eb4643346f9b444b0bb50ece321158145b55
