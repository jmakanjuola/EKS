<<<<<<< HEAD
resource "aws_iam_role" "earnest-eks-cluster" {
  name = "earnest-eks-cluster"
=======
resource "aws_iam_role" "demo-cluster" {
  name = "terraform-eks-demo-cluster"
>>>>>>> 5dc3eb4643346f9b444b0bb50ece321158145b55

  assume_role_policy = <<POLICY
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": {
        "Service": "eks.amazonaws.com"
      },
      "Action": "sts:AssumeRole"
    }
  ]
}
POLICY
}

<<<<<<< HEAD
resource "aws_iam_role_policy_attachment" "earnest-eks-cluster-AmazonEKSClusterPolicy" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSClusterPolicy"
  role       = "${aws_iam_role.earnest-eks-cluster.name}"
}

resource "aws_iam_role_policy_attachment" "earnest-eks-cluster-AmazonEKSServicePolicy" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSServicePolicy"
  role       = "${aws_iam_role.earnest-eks-cluster.name}"
=======
resource "aws_iam_role_policy_attachment" "demo-cluster-AmazonEKSClusterPolicy" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSClusterPolicy"
  role       = "${aws_iam_role.demo-cluster.name}"
}

resource "aws_iam_role_policy_attachment" "demo-cluster-AmazonEKSServicePolicy" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSServicePolicy"
  role       = "${aws_iam_role.demo-cluster.name}"
>>>>>>> 5dc3eb4643346f9b444b0bb50ece321158145b55
}

# If no loadbalancer was ever created in this region, then this following role is necessary
resource "aws_iam_role_policy" "demo-cluster-service-linked-role" {
  name = "service-linked-role"
  role = "${aws_iam_role.demo-cluster.name}"

  policy = <<EOF
{
<<<<<<< HEAD
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Action": "iam:CreateServiceLinkedRole",
            "Resource": "arn:aws:iam::*:role/aws-service-role/*"
        },
        {
            "Effect": "Allow",
            "Action": [
                "ec2:DescribeAccountAttributes"
            ],
            "Resource": "*"
        }
    ]
}

=======
      "Version": "2012-10-17",
      "Statement": [
          {
              "Effect": "Allow",
              "Action": "iam:CreateServiceLinkedRole",
              "Resource": "arn:aws:iam::*:role/aws-service-role/*"
          },
          {
              "Effect": "Allow",
              "Action": [
                  "ec2:DescribeAccountAttributes"
              ],
              "Resource": "*"
          }
      ]
  }
>>>>>>> 5dc3eb4643346f9b444b0bb50ece321158145b55
EOF
}
