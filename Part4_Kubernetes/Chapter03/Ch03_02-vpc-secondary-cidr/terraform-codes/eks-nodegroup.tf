resource "aws_eks_node_group" "hhtest-eks-nodegroup" {
  cluster_name    = aws_eks_cluster.hhtest-eks-cluster.name
  node_group_name = "hhtest-eks-nodegroup"
  node_role_arn   = aws_iam_role.hhtest-iam-role-eks-nodegroup.arn
  subnet_ids      = [aws_subnet.hhtest-public-subnet1.id, aws_subnet.hhtest-public-subnet3.id]
  instance_types = ["t3a.medium"]
  disk_size = 20

  labels = {
    "role" = "eks-nodegroup"
  }

  scaling_config {
    desired_size = 1
    min_size     = 1
    max_size     = 1
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

resource "aws_eks_node_group" "hhtest-eks-nodegroup2" {
  cluster_name    = aws_eks_cluster.hhtest-eks-cluster.name
  node_group_name = "hhtest-eks-nodegroup2"
  node_role_arn   = aws_iam_role.hhtest-iam-role-eks-nodegroup.arn
  subnet_ids      = [aws_subnet.hhtest-public-subnet1.id, aws_subnet.hhtest-public-subnet3.id]
  instance_types = ["t3a.medium"]
  disk_size = 20

  labels = {
    "role" = "eks-nodegroup2"
  }

  scaling_config {
    desired_size = 1
    min_size     = 1
    max_size     = 1
  }

  depends_on = [
    aws_iam_role_policy_attachment.hhtest-iam-policy-eks-nodegroup,
    aws_iam_role_policy_attachment.hhtest-iam-policy-eks-nodegroup-cni,
    aws_iam_role_policy_attachment.hhtest-iam-policy-eks-nodegroup-ecr,
  ]

  tags = {
    "Name" = "${aws_eks_cluster.hhtest-eks-cluster.name}-worker-node2"
  }
}