##__     ______   ____
##\ \   / /  _ \ / ___|
###\ \ / /| |_) | |
####\ V / |  __/| |___
#####\_/  |_|    \____|

# Create a VPC to launch our instances into
resource "aws_vpc" "vpc" {
  cidr_block = "${var.vpc["main"]}"

  tags = "${
    map(
     "Name", "${var.env}-vpc",
     "Environment", "${var.env}",
     "kubernetes.io/cluster/${var.cluster_defaults["name"]}", "shared"
    )
  }"
}

##____  _   _ ____  _   _ _____ _____
#/ ___|| | | | __ )| \ | | ____|_   _|
#\___ \| | | |  _ \|  \| |  _|   | |
##___) | |_| | |_) | |\  | |___  | |
#|____/ \___/|____/|_| \_|_____| |_|
# Subnets with AZ-A/C
resource "aws_subnet" "eks-private-subnet-2a" {
  vpc_id            = "${aws_vpc.vpc.id}"
  cidr_block        = "${var.vpc["eks-private-subnet-2a"]}"
  availability_zone = "${var.region}a"

  tags = "${
    map(
     "Name", "${var.env}-eks-private-subnet-2a",
     "Environment", "${var.env}-eks-private-subnet-2a",
     "kubernetes.io/cluster/${var.cluster_defaults["name"]}", "shared"
    )
  }"
}

resource "aws_subnet" "eks-private-subnet-2b" {
  vpc_id            = "${aws_vpc.vpc.id}"
  cidr_block        = "${var.vpc["eks-private-subnet-2b"]}"
  availability_zone = "${var.region}b"

  tags = "${
    map(
     "Name", "${var.env}-eks-private-subnet-2b",
     "Environment", "${var.env}",
     "kubernetes.io/cluster/${var.cluster_defaults["name"]}", "shared"
    )
  }"
}

resource "aws_subnet" "eks-private-subnet-2c" {
  vpc_id            = "${aws_vpc.vpc.id}"
  cidr_block        = "${var.vpc["eks-private-subnet-2c"]}"
  availability_zone = "${var.region}c"

  tags = "${
    map(
     "Name", "${var.env}-eks-private-subnet-2c",
     "Environment", "${var.env}",
     "kubernetes.io/cluster/${var.cluster_defaults["name"]}", "shared"
    )
  }"
}

##____  _   _ ____  _   _ _____ _____
#/ ___|| | | | __ )| \ | | ____|_   _|
#\___ \| | | |  _ \|  \| |  _|   | |
##___) | |_| | |_) | |\  | |___  | |
#|____/ \___/|____/|_| \_|_____| |_|
# Subnets with AZ-A/C
resource "aws_subnet" "eks-public-subnet-2a" {
  vpc_id            = "${aws_vpc.vpc.id}"
  cidr_block        = "${var.vpc["eks-public-subnet-2a"]}"
  availability_zone = "${var.region}a"

  tags = "${
    map(
     "Name", "${var.env}eks-public-subnet-2a",
     "Environment", "${var.env}",
    )
  }"
}

resource "aws_subnet" "eks-public-subnet-2b" {
  vpc_id            = "${aws_vpc.vpc.id}"
  cidr_block        = "${var.vpc["eks-public-subnet-2b"]}"
  availability_zone = "${var.region}b"

  tags = "${
    map(
     "Name", "${var.env}eks-public-subnet-2a",
     "Environment", "${var.env}",
    )
  }"
}

resource "aws_subnet" "eks-public-subnet-2c" {
  vpc_id            = "${aws_vpc.vpc.id}"
  cidr_block        = "${var.vpc["eks-public-subnet-2c"]}"
  availability_zone = "${var.region}c"

  tags = "${
    map(
     "Name", "${var.env}eks-public-subnet-2a",
     "Environment", "${var.env}",
    )
  }"
}

##  route table
resource "aws_route_table" "eks-private-rt" {
  vpc_id = "${aws_vpc.vpc.id}"

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "${aws_internet_gateway.igw.id}"
  }

  tags {
    Name        = "${var.env}-eks-private-rt-2a"
    Environment = "${var.env}"
  }
}

# route table association Zone-A
resource "aws_route_table_association" "eks-private-2a" {
  subnet_id      = "${aws_subnet.eks-private-subnet-2a.id}"
  route_table_id = "${aws_route_table.eks-private-rt.id}"
}

# route table association Zone-b
resource "aws_route_table_association" "eks-private-2b" {
  subnet_id      = "${aws_subnet.eks-private-subnet-2b.id}"
  route_table_id = "${aws_route_table.eks-private-rt.id}"
}

# route table association Zone-C
resource "aws_route_table_association" "eks-private-2c" {
  subnet_id      = "${aws_subnet.eks-private-subnet-2c.id}"
  route_table_id = "${aws_route_table.eks-private-rt.id}"
}

##___    ____  __        __
#|_ _|  / ___| \ \      / /
##| |  | |  _   \ \ /\ / /
##| |  | |_| |   \ V  V /
#|___|  \____|    \_/\_/
# Create an internet gateway to give our subnet access to the outside world
resource "aws_internet_gateway" "igw" {
  vpc_id = "${aws_vpc.vpc.id}"

  tags {
    Name        = "${var.env}-igw"
    Environment = "${var.env}"
  }
}
