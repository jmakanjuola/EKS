## keypair for ec2
resource "aws_key_pair" "eks-keypair" {
  key_name   = "eks-keypair"
  public_key = "${file("eks-key.pub")}"
}
