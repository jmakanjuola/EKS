<<<<<<< HEAD
resource "aws_iam_role" "earnest-eks-node" {
  name = "earnest-eks-node"
=======
resource "aws_iam_role" "demo-node" {
  name = "terraform-eks-demo-node"
>>>>>>> 5dc3eb4643346f9b444b0bb50ece321158145b55

  assume_role_policy = <<POLICY
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": {
        "Service": "ec2.amazonaws.com"
      },
      "Action": "sts:AssumeRole"
    }
  ]
}
POLICY
}

<<<<<<< HEAD
resource "aws_iam_role_policy_attachment" "earnest-eks-node-AmazonEKSWorkerNodePolicy" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSWorkerNodePolicy"
  role       = "${aws_iam_role.earnest-eks-node.name}"
}

resource "aws_iam_role_policy_attachment" "earnest-eks-node-AmazonEKS_CNI_Policy" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKS_CNI_Policy"
  role       = "${aws_iam_role.earnest-eks-node.name}"
}

resource "aws_iam_role_policy_attachment" "earnest-eks-node-AmazonEC2ContainerRegistryReadOnly" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryReadOnly"
  role       = "${aws_iam_role.earnest-eks-node.name}"
}

resource "aws_iam_instance_profile" "earnest-eks-node" {
  name = "earnest-eks-node"
  role = "${aws_iam_role.earnest-eks-node.name}"
=======
resource "aws_iam_role_policy_attachment" "demo-node-AmazonEKSWorkerNodePolicy" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSWorkerNodePolicy"
  role       = "${aws_iam_role.demo-node.name}"
}

resource "aws_iam_role_policy_attachment" "demo-node-AmazonEKS_CNI_Policy" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKS_CNI_Policy"
  role       = "${aws_iam_role.demo-node.name}"
}

resource "aws_iam_role_policy_attachment" "demo-node-AmazonEC2ContainerRegistryReadOnly" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryReadOnly"
  role       = "${aws_iam_role.demo-node.name}"
}

resource "aws_iam_instance_profile" "demo-node" {
  name = "terraform-eks-demo"
  role = "${aws_iam_role.demo-node.name}"
>>>>>>> 5dc3eb4643346f9b444b0bb50ece321158145b55
}
