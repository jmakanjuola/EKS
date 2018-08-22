<<<<<<< HEAD
resource "aws_security_group" "earnest-eks-sg" {
  vpc_id      = "${aws_vpc.earnest-eks-vpc.id}"
  name        = "earnest-eks-sg"
=======
resource "aws_security_group" "demo-eks-sg" {
  vpc_id      = "${aws_vpc.vpc.id}"
  name        = "demo-eks-sg"
>>>>>>> 5dc3eb4643346f9b444b0bb50ece321158145b55
  description = "Bastion Host ssh ingress & egress"

  #SSH Security Group
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"] #I'll update this to the IP
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
<<<<<<< HEAD
    cidr_blocks = ["64.125.36.170/32"]
  }

  tags {
    Name = "bastion-eks-ssh"
=======
    cidr_blocks = ["73.223.181.188/32"]
  }

  tags {
    Name = "demo-eks-ssh"
>>>>>>> 5dc3eb4643346f9b444b0bb50ece321158145b55
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 0
    to_port     = 65535
    protocol    = "tcp"
<<<<<<< HEAD
    cidr_blocks = ["64.125.36.170/32"]
=======
    cidr_blocks = ["73.223.181.188/32"]
>>>>>>> 5dc3eb4643346f9b444b0bb50ece321158145b55
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
<<<<<<< HEAD
    cidr_blocks = ["0.0.0.0/0"]
=======
    cidr_blocks = ["73.223.181.188/32"]
>>>>>>> 5dc3eb4643346f9b444b0bb50ece321158145b55
  }

  ingress {
    from_port   = 1025
    to_port     = 65535
    protocol    = "tcp"
<<<<<<< HEAD
    cidr_blocks = ["64.125.36.170/32"]
=======
    cidr_blocks = ["73.223.181.188/32"]
>>>>>>> 5dc3eb4643346f9b444b0bb50ece321158145b55
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
<<<<<<< HEAD
    cidr_blocks = ["64.125.36.170/32"]
=======
    cidr_blocks = ["73.223.181.188/32"]
>>>>>>> 5dc3eb4643346f9b444b0bb50ece321158145b55
  }
}
