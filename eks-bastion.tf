########     ###     ######  ######## ####  #######  ##    ##
##     ##   ## ##   ##    ##    ##     ##  ##     ## ###   ##
##     ##  ##   ##  ##          ##     ##  ##     ## ####  ##
########  ##     ##  ######     ##     ##  ##     ## ## ## ##
##     ## #########       ##    ##     ##  ##     ## ##  ####
##     ## ##     ## ##    ##    ##     ##  ##     ## ##   ###
########  ##     ##  ######     ##    ####  #######  ##    ##

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
  associate_public_ip_address = true

  tags {
    Name = "EKS-Bastion-Host"
  }
}
