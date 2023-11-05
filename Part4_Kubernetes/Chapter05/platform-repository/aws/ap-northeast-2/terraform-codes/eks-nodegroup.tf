resource "aws_eks_node_group" "testhh-eks-nodegroup" {
  cluster_name    = aws_eks_cluster.testhh-eks-cluster.name
  node_group_name = "testhh-eks-nodegroup"
  node_role_arn   = aws_iam_role.testhh-iam-role-eks-nodegroup.arn
  subnet_ids      = [aws_subnet.testhh-public-subnet1.id, aws_subnet.testhh-public-subnet3.id]
  instance_types = ["t3a.medium"]
  disk_size = 20

  labels = {
    "role" = "eks-nodegroup"
  }

  scaling_config {
    desired_size = 2
    min_size     = 1
    max_size     = 3
  }

  depends_on = [
    aws_iam_role_policy_attachment.testhh-iam-policy-eks-nodegroup,
    aws_iam_role_policy_attachment.testhh-iam-policy-eks-nodegroup-cni,
    aws_iam_role_policy_attachment.testhh-iam-policy-eks-nodegroup-ecr,
  ]

  tags = {
    "Name" = "${aws_eks_cluster.testhh-eks-cluster.name}-worker-node"
  }
}