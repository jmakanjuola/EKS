resource "aws_eip" "demo-eks-nat-eip" {
  vpc = true
}

resource "aws_nat_gateway" "demo-eks-nat-gw" {
  allocation_id = "${aws_eip.demo-eks-nat-eip.id}"
  subnet_id     = "${aws_subnet.eks-public-subnet-2a.id}"
  depends_on    = ["aws_internet_gateway.igw"]
  tags {
    Name = "demo-eks-nat-gw"
  }
}

# VPC setup for NAT

resource "aws_route_table" "demo-eks-nat-public-rt" {
  vpc_id = "${aws_vpc.vpc.id}"
  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = "${aws_nat_gateway.demo-eks-nat-gw.id}"
  }

  tags {
    Name = "demo-eks-nat-pub"

  }
}

# Private Subnet route associations public

resource "aws_route_table_association" "eks-public-subnet-2a" {
  subnet_id      = "${aws_subnet.eks-public-subnet-2a.id}"
  route_table_id = "${aws_route_table.demo-eks-nat-public-rt.id}"
}

resource "aws_route_table_association" "eks-public-subnet-2b" {
  subnet_id      = "${aws_subnet.eks-public-subnet-2b.id}"
  route_table_id = "${aws_route_table.demo-eks-nat-public-rt.id}"
}

resource "aws_route_table_association" "eks-public-subnet-2c" {
  subnet_id      = "${aws_subnet.eks-public-subnet-2c.id}"
  route_table_id = "${aws_route_table.demo-eks-nat-public-rt.id}"
}
