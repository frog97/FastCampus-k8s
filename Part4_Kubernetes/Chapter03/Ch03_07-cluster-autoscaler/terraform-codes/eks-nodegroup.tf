resource "aws_eks_node_group" "hhtest-eks-nodegroup" {
  cluster_name    = aws_eks_cluster.hhtest-eks-cluster.name
  node_group_name = "hhtest-eks-nodegroup"
  node_role_arn   = aws_iam_role.hhtest-iam-role-eks-nodegroup.arn
  subnet_ids      = [aws_subnet.hhtest-private-subnet1.id, aws_subnet.hhtest-private-subnet3.id]
  instance_types = ["t3a.medium"]
  disk_size = 20

  labels = {
    "role" = "eks-nodegroup"
  }

  scaling_config {
    desired_size = 2
    min_size     = 1
    max_size     = 6
  }

  depends_on = [
    aws_iam_role_policy_attachment.hhtest-iam-policy-eks-nodegroup,
    aws_iam_role_policy_attachment.hhtest-iam-policy-eks-nodegroup-cni,
    aws_iam_role_policy_attachment.hhtest-iam-policy-eks-nodegroup-ecr,
  ]

  tags = {
    "Name" = "${aws_eks_cluster.hhtest-eks-cluster.name}-worker-node"
  }
}