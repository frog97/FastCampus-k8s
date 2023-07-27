resource "aws_eks_node_group" "hh-fc-k8s4dev-eks-nodegroup" {
  cluster_name    = aws_eks_cluster.hh-fc-k8s4dev-eks-cluster.name
  node_group_name = "hh-fc-k8s4dev-eks-nodegroup"
  node_role_arn   = aws_iam_role.hh-fc-k8s4dev-iam-role-eks-nodegroup.arn
  subnet_ids      = ["subnet-06891e5a7b4742071","subnet-09869431922bdc2d3"]
  #instance_types = ["t3a.medium"]
  #disk_size = 20

  labels = {
    "role" = "eks-nodegroup"
  }

  scaling_config {
    desired_size = 2
    min_size     = 1
    max_size     = 3
  }

  depends_on = [
    aws_iam_role_policy_attachment.hh-fc-k8s4dev-iam-policy-eks-nodegroup,
    aws_iam_role_policy_attachment.hh-fc-k8s4dev-iam-policy-eks-nodegroup-cni,
    aws_iam_role_policy_attachment.hh-fc-k8s4dev-iam-policy-eks-nodegroup-ecr,
  ]

  tags = {
    "Name" = "${aws_eks_cluster.hh-fc-k8s4dev-eks-cluster.name}-worker-node"
  }
}
