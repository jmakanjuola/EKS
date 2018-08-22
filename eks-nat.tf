resource "aws_eip" "earnest-eks-nat-eip" {
  vpc = true
}

resource "aws_nat_gateway" "earnest-eks-nat-gw" {
  allocation_id = "${aws_eip.earnest-eks-nat-eip.id}"
  subnet_id     = "${aws_subnet.eks-public-subnet-1a.id}"
  depends_on    = ["aws_internet_gateway.earnest-eks-igw"]

  tags {
    Name = "earnest-eks-nat-gw"
  }
}

# VPC setup for NAT
resource "aws_route_table" "earnest-eks-nat-public-rt" {
  vpc_id = "${aws_vpc.earnest-eks-vpc.id}"

  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = "${aws_nat_gateway.earnest-eks-nat-gw.id}"
  }

  tags {
    Name = "earnest-eks-nat-pub"
  }
}

# Private Subnet route associations public
resource "aws_route_table_association" "eks-public-subnet-1a" {
  subnet_id      = "${aws_subnet.eks-public-subnet-1a.id}"
  route_table_id = "${aws_route_table.earnest-eks-nat-public-rt.id}"
}

resource "aws_route_table_association" "eks-public-subnet-1b" {
  subnet_id      = "${aws_subnet.eks-public-subnet-1b.id}"
  route_table_id = "${aws_route_table.earnest-eks-nat-public-rt.id}"
}

resource "aws_route_table_association" "eks-public-subnet-1c" {
  subnet_id      = "${aws_subnet.eks-public-subnet-1c.id}"
  route_table_id = "${aws_route_table.earnest-eks-nat-public-rt.id}"
}
