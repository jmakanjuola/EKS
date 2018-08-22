# outputs
locals {
  kubeconfig = <<KUBECONFIG
apiVersion: v1
clusters:
- cluster:
<<<<<<< HEAD
    server: ${aws_eks_cluster.earnest-eks-cluster.endpoint}
    certificate-authority-data: ${aws_eks_cluster.earnest-eks-cluster.certificate_authority.0.data}
=======
    server: ${aws_eks_cluster.demo.endpoint}
    certificate-authority-data: ${aws_eks_cluster.demo.certificate_authority.0.data}
>>>>>>> 5dc3eb4643346f9b444b0bb50ece321158145b55
  name: kubernetes
contexts:
- context:
    cluster: kubernetes
    user: aws
  name: aws
current-context: aws
kind: Config
preferences: {}
users:
- name: aws
  user:
    exec:
      apiVersion: client.authentication.k8s.io/v1alpha1
<<<<<<< HEAD
      command: heptio-authenticator-aws
      args:
        - "token"
        - "-i"
        - "${var.earnest-eks-cluster-name}"
=======
      command: aws-iam-authenticator
      args:
        - "token"
        - "-i"
        - "${var.cluster-name}"
        
>>>>>>> 5dc3eb4643346f9b444b0bb50ece321158145b55
KUBECONFIG
}

output "kubeconfig" {
  value = "${local.kubeconfig}"
}

# Join configuration

locals {
  config-map-aws-auth = <<CONFIGMAPAWSAUTH
apiVersion: v1
kind: ConfigMap
metadata:
  name: aws-auth
  namespace: kube-system
data:
  mapRoles: |
<<<<<<< HEAD
    - rolearn: ${aws_iam_role.earnest-eks-node.arn}
=======
    - rolearn: ${aws_iam_role.demo-node.arn}
>>>>>>> 5dc3eb4643346f9b444b0bb50ece321158145b55
      username: system:node:{{EC2PrivateDNSName}}
      groups:
        - system:bootstrappers
        - system:nodes
CONFIGMAPAWSAUTH
}

output "config-map-aws-auth" {
  value = "${local.config-map-aws-auth}"
}
