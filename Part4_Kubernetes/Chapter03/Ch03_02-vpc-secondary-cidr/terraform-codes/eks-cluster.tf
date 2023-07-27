resource "aws_eks_cluster" "hhtest-eks-cluster" {

  depends_on = [
    aws_iam_role_policy_attachment.hhtest-iam-policy-eks-cluster,
    aws_iam_role_policy_attachment.hhtest-iam-policy-eks-cluster-vpc,
  ]

  name     = var.cluster-name
  role_arn = aws_iam_role.hhtest-iam-role-eks-cluster.arn
  version = "1.27"

  enabled_cluster_log_types = ["api", "audit", "authenticator", "controllerManager", "scheduler"]

  vpc_config {
    security_group_ids = [aws_security_group.hhtest-sg-eks-cluster.id]
    subnet_ids         = [aws_subnet.hhtest-public-subnet1.id, aws_subnet.hhtest-public-subnet3.id]
    endpoint_public_access = true
  }


}
