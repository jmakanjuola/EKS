data "aws_ami" "eks-worker" {
  filter {
    name   = "name"
    values = ["eks-worker-*"]
  }

  most_recent = true
  owners      = ["602401143452"] # Amazon
}

# EKS currently documents this required userdata for EKS worker nodes to
# properly configure Kubernetes applications on the EC2 instance.
# We utilize a Terraform local here to simplify Base64 encoding this
# information into the AutoScaling Launch Configuration.

# More information: https://amazon-eks.s3-us-west-1.amazonaws.com/1.10.3/2018-06-05/amazon-eks-nodegroup.yaml
locals {
  earnest-eks-node-userdata = <<USERDATA
# More information: https://amazon-eks.s3-us-west-2.amazonaws.com/1.10.3/2018-06-05/amazon-eks-nodegroup.yaml
locals {
#!/bin/bash -xe
CA_CERTIFICATE_DIRECTORY=/etc/kubernetes/pki
CA_CERTIFICATE_FILE_PATH=$CA_CERTIFICATE_DIRECTORY/ca.crt
mkdir -p $CA_CERTIFICATE_DIRECTORY
echo "${aws_eks_cluster.earnest-eks-cluster.certificate_authority.0.data}" | base64 -d >  $CA_CERTIFICATE_FILE_PATH
INTERNAL_IP=$(curl -s http://169.254.169.254/latest/meta-data/local-ipv4)
sed -i s,MASTER_ENDPOINT,${aws_eks_cluster.earnest-eks-cluster.endpoint},g /var/lib/kubelet/kubeconfig
sed -i s,CLUSTER_NAME,${var.earnest-eks-cluster-name},g /var/lib/kubelet/kubeconfig
sed -i s,REGION,${data.aws_region.current.name},g /etc/systemd/system/kubelet.service
sed -i s,MAX_PODS,20,g /etc/systemd/system/kubelet.service
sed -i s,MASTER_ENDPOINT,${aws_eks_cluster.earnest-eks-cluster.endpoint},g /etc/systemd/system/kubelet.service

# echo "${aws_eks_cluster.demo.certificate_authority.0.data}" | base64 -d >  $CA_CERTIFICATE_FILE_PATH
# INTERNAL_IP=$(curl -s http://169.254.169.254/latest/meta-data/local-ipv4)
# sed -i s,MASTER_ENDPOINT,${aws_eks_cluster.demo.endpoint},g /var/lib/kubelet/kubeconfig
# sed -i s,CLUSTER_NAME,${var.cluster-name},g /var/lib/kubelet/kubeconfig
# sed -i s,REGION,${data.aws_region.current.name},g /etc/systemd/system/kubelet.service
# sed -i s,MAX_PODS,20,g /etc/systemd/system/kubelet.service
# sed -i s,MASTER_ENDPOINT,${aws_eks_cluster.demo.endpoint},g /etc/systemd/system/kubelet.service

sed -i s,INTERNAL_IP,$INTERNAL_IP,g /etc/systemd/system/kubelet.service
DNS_CLUSTER_IP=10.100.0.10
if [[ $INTERNAL_IP == 10.* ]] ; then DNS_CLUSTER_IP=172.20.0.10; fi
sed -i s,DNS_CLUSTER_IP,$DNS_CLUSTER_IP,g /etc/systemd/system/kubelet.service
sed -i s,CERTIFICATE_AUTHORITY_FILE,$CA_CERTIFICATE_FILE_PATH,g /var/lib/kubelet/kubeconfig
sed -i s,CLIENT_CA_FILE,$CA_CERTIFICATE_FILE_PATH,g  /etc/systemd/system/kubelet.service
systemctl daemon-reload
systemctl restart kubelet
USERDATA
}


resource "aws_launch_configuration" "earnest-eks" {
  associate_public_ip_address = true
  iam_instance_profile        = "${aws_iam_instance_profile.earnest-eks-node.name}"
  image_id                    = "${data.aws_ami.eks-worker.id}"
  instance_type               = "t2.medium"
  name_prefix                 = "earnest-eks"
  security_groups             = ["${aws_security_group.earnest-eks-node.id}"]
  user_data_base64            = "${base64encode(local.earnest-eks-node-userdata)}"

  lifecycle {
    create_before_destroy = true
  }
}


resource "aws_autoscaling_group" "earnest-eks" {
  desired_capacity     = 2
  launch_configuration = "${aws_launch_configuration.earnest-eks.id}"
  max_size             = 2
  min_size             = 1
  name                 = "earnest-eks-asg"
  vpc_zone_identifier  = ["${aws_subnet.eks-private-subnet-1a.id}", "${aws_subnet.eks-private-subnet-1b.id}", "${aws_subnet.eks-private-subnet-1c.id}"]

  tag {
    key                 = "Name"
    value               = "earnest-eks-demo-asg"

    propagate_at_launch = true
  }

  tag {

    key                 = "kubernetes.io/cluster/${var.earnest-eks-cluster-name}"
    value               = "owned"
    propagate_at_launch = true
  }
}
