##__     ______   ____
##\ \   / /  _ \ / ___|
###\ \ / /| |_) | |
####\ V / |  __/| |___
#####\_/  |_|    \____|

# Create a VPC to launch our instances into
resource "aws_vpc" "earnest-eks-vpc" {
  cidr_block = "${var.earnest-eks-vpc["main"]}"

  tags = "${
    map(
     "Name", "${var.env}-earnest-eks-vpc",
     "Environment", "${var.env}",
     "kubernetes.io/cluster/${var.earnest-eks-cluster-defaults["name"]}", "shared"
    )
  }"
}

##____  _   _ ____  _   _ _____ _____
#/ ___|| | | | __ )| \ | | ____|_   _|
#\___ \| | | |  _ \|  \| |  _|   | |
##___) | |_| | |_) | |\  | |___  | |
#|____/ \___/|____/|_| \_|_____| |_|
# Subnets with AZ-A/C
resource "aws_subnet" "eks-private-subnet-1a" {
  vpc_id            = "${aws_vpc.earnest-eks-vpc.id}"
  cidr_block        = "${var.earnest-eks-vpc["eks-private-subnet-1a"]}"
  availability_zone = "${var.aws_region}a"

  tags = "${
    map(
     "Name", "${var.env}-eks-private-subnet-1a",
     "Environment", "${var.env}-eks-private-subnet-1a",
     "kubernetes.io/cluster/${var.earnest-eks-cluster-defaults["name"]}", "shared"
    )
  }"
}

resource "aws_subnet" "eks-private-subnet-1b" {
  vpc_id            = "${aws_vpc.earnest-eks-vpc.id}"
  cidr_block        = "${var.earnest-eks-vpc["eks-private-subnet-1b"]}"
  availability_zone = "${var.aws_region}b"

  tags = "${
    map(
     "Name", "${var.env}-eks-private-subnet-1b",
     "Environment", "${var.env}",
     "kubernetes.io/cluster/${var.earnest-eks-cluster-defaults["name"]}", "shared"
    )
  }"
}

resource "aws_subnet" "eks-private-subnet-1c" {
  vpc_id            = "${aws_vpc.earnest-eks-vpc.id}"
  cidr_block        = "${var.earnest-eks-vpc["eks-private-subnet-1c"]}"
  availability_zone = "${var.aws_region}c"

  tags = "${
    map(
     "Name", "${var.env}-eks-private-subnet-1c",
     "Environment", "${var.env}",
     "kubernetes.io/cluster/${var.earnest-eks-cluster-defaults["name"]}", "shared"
    )
  }"
}

##____  _   _ ____  _   _ _____ _____
#/ ___|| | | | __ )| \ | | ____|_   _|
#\___ \| | | |  _ \|  \| |  _|   | |
##___) | |_| | |_) | |\  | |___  | |
#|____/ \___/|____/|_| \_|_____| |_|
# Subnets with AZ-A/C
resource "aws_subnet" "eks-public-subnet-1a" {
  vpc_id            = "${aws_vpc.earnest-eks-vpc.id}"
  cidr_block        = "${var.earnest-eks-vpc["eks-public-subnet-1a"]}"
  availability_zone = "${var.aws_region}a"

  tags = "${
    map(
     "Name", "${var.env}eks-public-subnet-1a",
     "Environment", "${var.env}",
    )
  }"
}

resource "aws_subnet" "eks-public-subnet-1b" {
  vpc_id            = "${aws_vpc.earnest-eks-vpc.id}"
  cidr_block        = "${var.earnest-eks-vpc["eks-public-subnet-1b"]}"
  availability_zone = "${var.aws_region}b"

  tags = "${
    map(
     "Name", "${var.env}eks-public-subnet-1a",
     "Environment", "${var.env}",
    )
  }"
}

resource "aws_subnet" "eks-public-subnet-1c" {
  vpc_id            = "${aws_vpc.earnest-eks-vpc.id}"
  cidr_block        = "${var.earnest-eks-vpc["eks-public-subnet-1c"]}"
  availability_zone = "${var.aws_region}c"

  tags = "${
    map(
     "Name", "${var.env}eks-public-subnet-1a",
     "Environment", "${var.env}",
    )
  }"
}

##  route table
resource "aws_route_table" "eks-private-rt" {
  vpc_id = "${aws_vpc.earnest-eks-vpc.id}"

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "${aws_internet_gateway.earnest-eks-igw.id}"
  }

  tags {
    Name        = "${var.env}-eks-private-rt-1a"
    Environment = "${var.env}"
  }
}

# route table association Zone-A
resource "aws_route_table_association" "eks-private-1a" {
  subnet_id      = "${aws_subnet.eks-private-subnet-1a.id}"
  route_table_id = "${aws_route_table.eks-private-rt.id}"
}

# route table association Zone-b
resource "aws_route_table_association" "eks-private-1b" {
  subnet_id      = "${aws_subnet.eks-private-subnet-1b.id}"
  route_table_id = "${aws_route_table.eks-private-rt.id}"
}

# route table association Zone-C
resource "aws_route_table_association" "eks-private-1c" {
  subnet_id      = "${aws_subnet.eks-private-subnet-1c.id}"
  route_table_id = "${aws_route_table.eks-private-rt.id}"
}

##___    ____  __        __
#|_ _|  / ___| \ \      / /
##| |  | |  _   \ \ /\ / /
##| |  | |_| |   \ V  V /
#|___|  \____|    \_/\_/
# Create an internet gateway to give our subnet access to the outside world
resource "aws_internet_gateway" "earnest-eks-igw" {
  vpc_id = "${aws_vpc.earnest-eks-vpc.id}"

  tags {
    Name        = "${var.env}-igw"
    Environment = "${var.env}"
  }
}
