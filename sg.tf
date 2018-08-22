# This security group controls networking access to the Kubernetes masters.

resource "aws_security_group" "earnest-eks-cluster" {
  name        = "earnest-eks-cluster"
  description = "Cluster communication with worker nodes"
  vpc_id      = "${aws_vpc.earnest-eks-vpc.id}"

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags {
    Name = "earnest-eks-cluster-sg"
  }
}

resource "aws_security_group_rule" "earnest-eks-cluster-ingress-node-https" {
  description              = "Allow pods to communicate with the cluster API Server"
  from_port                = 443
  protocol                 = "tcp"
  security_group_id        = "${aws_security_group.earnest-eks-cluster.id}"
  source_security_group_id = "${aws_security_group.earnest-eks-node.id}"
  to_port                  = 443
  type                     = "ingress"
}

resource "aws_security_group_rule" "demo-cluster-ingress-workstation-https" {
  cidr_blocks       = ["${local.workstation-external-cidr}"]
  description       = "Allow workstation to communicate with the cluster API Server"
  from_port         = 443
  protocol          = "tcp"
  security_group_id = "${aws_security_group.earnest-eks-cluster.id}"
  to_port           = 443
  type              = "ingress"
}
