# This resource is the actual Kubernetes master cluster

resource "aws_eks_cluster" "earnest-eks-cluster" {
  name     = "${var.earnest-eks-cluster-name}"
  role_arn = "${aws_iam_role.earnest-eks-cluster.arn}"

  vpc_config {
    security_group_ids = ["${aws_security_group.earnest-eks-cluster.id}"]

    subnet_ids = [
      "${aws_subnet.eks-private-subnet-1a.id}",
      "${aws_subnet.eks-private-subnet-1b.id}",
      "${aws_subnet.eks-private-subnet-1c.id}",
    ]
  }

  depends_on = [
    "aws_iam_role_policy_attachment.earnest-eks-cluster-AmazonEKSClusterPolicy",
    "aws_iam_role_policy_attachment.earnest-eks-cluster-AmazonEKSServicePolicy",
  ]
}
