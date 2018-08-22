# workers
resource "aws_security_group" "earnest-eks-node" {
  name        = "earnest-eks-node"
  description = "Security group for all nodes in the cluster"
  vpc_id      = "${aws_vpc.earnest-eks-vpc.id}"

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = "${
    map(
     "Name", "earnest-eks-node",
     "kubernetes.io/cluster/${var.earnest-eks-cluster-name}", "owned",
    )
  }"
}

resource "aws_security_group_rule" "earnest-eks-node-ingress-self" {
  description              = "Allow node to communicate with each other"
  from_port                = 0
  protocol                 = "-1"
  security_group_id        = "${aws_security_group.earnest-eks-node.id}"
  source_security_group_id = "${aws_security_group.earnest-eks-node.id}"
  to_port                  = 65535
  type                     = "ingress"
}

resource "aws_security_group_rule" "earnest-eks-node-ingress-cluster" {
  description              = "Allow worker Kubelets and pods to receive communication from the cluster control plane"
  from_port                = 1025
  protocol                 = "tcp"
  security_group_id        = "${aws_security_group.earnest-eks-node.id}"
  source_security_group_id = "${aws_security_group.earnest-eks-cluster.id}"
  to_port                  = 65535
  type                     = "ingress"
}
