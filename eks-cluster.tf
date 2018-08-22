# This resource is the actual Kubernetes master cluster

<<<<<<< HEAD
resource "aws_eks_cluster" "earnest-eks-cluster" {
  name     = "${var.earnest-eks-cluster-name}"
  role_arn = "${aws_iam_role.earnest-eks-cluster.arn}"

  vpc_config {
    security_group_ids = ["${aws_security_group.earnest-eks-cluster.id}"]

    subnet_ids = [
      "${aws_subnet.eks-private-subnet-1a.id}",
      "${aws_subnet.eks-private-subnet-1b.id}",
      "${aws_subnet.eks-private-subnet-1c.id}",
=======
resource "aws_eks_cluster" "demo" {
  name     = "${var.cluster-name}"
  role_arn = "${aws_iam_role.demo-cluster.arn}"

  vpc_config {
    security_group_ids = ["${aws_security_group.demo-cluster.id}"]

    subnet_ids = [
      "${aws_subnet.eks-private-subnet-2a.id}",
      "${aws_subnet.eks-private-subnet-2b.id}",
      "${aws_subnet.eks-private-subnet-2c.id}",
>>>>>>> 5dc3eb4643346f9b444b0bb50ece321158145b55
    ]
  }

  depends_on = [
<<<<<<< HEAD
    "aws_iam_role_policy_attachment.earnest-eks-cluster-AmazonEKSClusterPolicy",
    "aws_iam_role_policy_attachment.earnest-eks-cluster-AmazonEKSServicePolicy",
=======
    "aws_iam_role_policy_attachment.demo-cluster-AmazonEKSClusterPolicy",
    "aws_iam_role_policy_attachment.demo-cluster-AmazonEKSServicePolicy",
>>>>>>> 5dc3eb4643346f9b444b0bb50ece321158145b55
  ]
}
