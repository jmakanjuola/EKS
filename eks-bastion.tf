########     ###     ######  ######## ####  #######  ##    ##
##     ##   ## ##   ##    ##    ##     ##  ##     ## ###   ##
##     ##  ##   ##  ##          ##     ##  ##     ## ####  ##
########  ##     ##  ######     ##     ##  ##     ## ## ## ##
##     ## #########       ##    ##     ##  ##     ## ##  ####
##     ## ##     ## ##    ##    ##     ##  ##     ## ##   ###
########  ##     ##  ######     ##    ####  #######  ##    ##

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
  associate_public_ip_address = true

  tags {
    Name = "EKS-Bastion-Host"
  }
}
