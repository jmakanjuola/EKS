<<<<<<< HEAD
resource "aws_eip" "earnest-eks-nat-eip" {
  vpc = true
}

resource "aws_nat_gateway" "earnest-eks-nat-gw" {
  allocation_id = "${aws_eip.earnest-eks-nat-eip.id}"
  subnet_id     = "${aws_subnet.eks-public-subnet-1a.id}"
  depends_on    = ["aws_internet_gateway.earnest-eks-igw"]

  tags {
    Name = "earnest-eks-nat-gw"
=======
resource "aws_eip" "demo-eks-nat-eip" {
  vpc = true
}

resource "aws_nat_gateway" "demo-eks-nat-gw" {
  allocation_id = "${aws_eip.demo-eks-nat-eip.id}"
  subnet_id     = "${aws_subnet.eks-public-subnet-2a.id}"
  depends_on    = ["aws_internet_gateway.igw"]

  tags {
    Name = "demo-eks-nat-gw"
>>>>>>> 5dc3eb4643346f9b444b0bb50ece321158145b55
  }
}

# VPC setup for NAT
<<<<<<< HEAD
resource "aws_route_table" "earnest-eks-nat-public-rt" {
  vpc_id = "${aws_vpc.earnest-eks-vpc.id}"

  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = "${aws_nat_gateway.earnest-eks-nat-gw.id}"
  }

  tags {
    Name = "earnest-eks-nat-pub"
=======
resource "aws_route_table" "demo-eks-nat-public-rt" {
  vpc_id = "${aws_vpc.vpc.id}"

  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = "${aws_nat_gateway.demo-eks-nat-gw.id}"
  }

  tags {
    Name = "demo-eks-nat-pub"
>>>>>>> 5dc3eb4643346f9b444b0bb50ece321158145b55
  }
}

# Private Subnet route associations public
<<<<<<< HEAD
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
=======
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
>>>>>>> 5dc3eb4643346f9b444b0bb50ece321158145b55
}
