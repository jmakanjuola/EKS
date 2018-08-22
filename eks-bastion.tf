########     ###     ######  ######## ####  #######  ##    ##
##     ##   ## ##   ##    ##    ##     ##  ##     ## ###   ##
##     ##  ##   ##  ##          ##     ##  ##     ## ####  ##
########  ##     ##  ######     ##     ##  ##     ## ## ## ##
##     ## #########       ##    ##     ##  ##     ## ##  ####
##     ## ##     ## ##    ##    ##     ##  ##     ## ##   ###
########  ##     ##  ######     ##    ####  #######  ##    ##

<<<<<<< HEAD
resource "aws_eip" "earnest-eks-eip" {
  instance = "${aws_instance.earnest-eks-bastion.id}"
  vpc      = true
}

resource "aws_instance" "earnest-eks-bastion" {
  ami                         = "${lookup(var.amis, var.aws_region)}"
  instance_type               = "t2.micro"
  availability_zone           = "us-east-1a"
  key_name                    = "${aws_key_pair.eks-keypair.key_name}"
  subnet_id                   = "${aws_subnet.eks-public-subnet-1a.id}"
  vpc_security_group_ids      = ["${aws_security_group.earnest-eks-sg.id}"]
=======
resource "aws_eip" "demo-eks-eip" {
  instance = "${aws_instance.demo-eks-bastion.id}"
  vpc      = true
}

resource "aws_instance" "demo-eks-bastion" {
  ami                         = "${lookup(var.amis, var.region)}"
  instance_type               = "t2.micro"
  availability_zone           = "us-west-2a"
  key_name                    = "${aws_key_pair.eks-keypair.key_name}"
  subnet_id                   = "${aws_subnet.eks-public-subnet-2a.id}"
  vpc_security_group_ids      = ["${aws_security_group.demo-eks-sg.id}"]
>>>>>>> 5dc3eb4643346f9b444b0bb50ece321158145b55
  associate_public_ip_address = true

  tags {
    Name = "EKS-Bastion-Host"
  }
}
