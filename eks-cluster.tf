# This resource is the actual Kubernetes master cluster

resource "aws_eks_cluster" "demo" {
  name     = "${var.cluster-name}"
  role_arn = "${aws_iam_role.demo-cluster.arn}"

  vpc_config {
    security_group_ids = ["${aws_security_group.demo-cluster.id}"]

    subnet_ids = [
      "${aws_subnet.eks-private-subnet-2a.id}",
      "${aws_subnet.eks-private-subnet-2b.id}",
      "${aws_subnet.eks-private-subnet-2c.id}",
    ]
  }

  depends_on = [
    "aws_iam_role_policy_attachment.demo-cluster-AmazonEKSClusterPolicy",
    "aws_iam_role_policy_attachment.demo-cluster-AmazonEKSServicePolicy",
  ]
}
