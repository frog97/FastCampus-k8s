resource "aws_eks_cluster" "testhh-eks-cluster" {

  depends_on = [
    aws_iam_role_policy_attachment.testhh-iam-policy-eks-cluster,
    aws_iam_role_policy_attachment.testhh-iam-policy-eks-cluster-vpc,
  ]

  name     = var.cluster-name
  role_arn = aws_iam_role.testhh-iam-role-eks-cluster.arn
  version = "1.28"

  enabled_cluster_log_types = ["api", "audit", "authenticator", "controllerManager", "scheduler"]

  vpc_config {
    security_group_ids = [aws_security_group.testhh-sg-eks-cluster.id]
    subnet_ids         = [aws_subnet.testhh-public-subnet1.id, aws_subnet.testhh-public-subnet3.id]
    endpoint_public_access = true
  }


}