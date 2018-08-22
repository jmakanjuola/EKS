# workers
<<<<<<< HEAD
resource "aws_security_group" "earnest-eks-node" {
  name        = "earnest-eks-node"
  description = "Security group for all nodes in the cluster"
  vpc_id      = "${aws_vpc.earnest-eks-vpc.id}"
=======
resource "aws_security_group" "demo-node" {
  name        = "terraform-eks-demo-node"
  description = "Security group for all nodes in the cluster"
  vpc_id      = "${aws_vpc.vpc.id}"
>>>>>>> 5dc3eb4643346f9b444b0bb50ece321158145b55

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = "${
    map(
<<<<<<< HEAD
     "Name", "earnest-eks-node",
     "kubernetes.io/cluster/${var.earnest-eks-cluster-name}", "owned",
=======
     "Name", "terraform-eks-demo-node",
     "kubernetes.io/cluster/${var.cluster-name}", "owned",
>>>>>>> 5dc3eb4643346f9b444b0bb50ece321158145b55
    )
  }"
}

<<<<<<< HEAD
resource "aws_security_group_rule" "earnest-eks-node-ingress-self" {
  description              = "Allow node to communicate with each other"
  from_port                = 0
  protocol                 = "-1"
  security_group_id        = "${aws_security_group.earnest-eks-node.id}"
  source_security_group_id = "${aws_security_group.earnest-eks-node.id}"
=======
resource "aws_security_group_rule" "demo-node-ingress-self" {
  description              = "Allow node to communicate with each other"
  from_port                = 0
  protocol                 = "-1"
  security_group_id        = "${aws_security_group.demo-node.id}"
  source_security_group_id = "${aws_security_group.demo-node.id}"
>>>>>>> 5dc3eb4643346f9b444b0bb50ece321158145b55
  to_port                  = 65535
  type                     = "ingress"
}

<<<<<<< HEAD
resource "aws_security_group_rule" "earnest-eks-node-ingress-cluster" {
  description              = "Allow worker Kubelets and pods to receive communication from the cluster control plane"
  from_port                = 1025
  protocol                 = "tcp"
  security_group_id        = "${aws_security_group.earnest-eks-node.id}"
  source_security_group_id = "${aws_security_group.earnest-eks-cluster.id}"
=======
resource "aws_security_group_rule" "demo-node-ingress-cluster" {
  description              = "Allow worker Kubelets and pods to receive communication from the cluster control plane"
  from_port                = 1025
  protocol                 = "tcp"
  security_group_id        = "${aws_security_group.demo-node.id}"
  source_security_group_id = "${aws_security_group.demo-cluster.id}"
>>>>>>> 5dc3eb4643346f9b444b0bb50ece321158145b55
  to_port                  = 65535
  type                     = "ingress"
}
