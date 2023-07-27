resource "aws_eks_cluster" "hh-fc-k8s4dev-eks-cluster" {

  depends_on = [
    aws_iam_role_policy_attachment.hh-fc-k8s4dev-iam-policy-eks-cluster, # 롤을 미리 만들어야 함. 
    aws_iam_role_policy_attachment.hh-fc-k8s4dev-iam-policy-eks-cluster-vpc,
  ]

  name     = var.cluster-name
  role_arn = aws_iam_role.hh-fc-k8s4dev-iam-role-eks-cluster.arn
  version = "1.27"

  enabled_cluster_log_types = ["api", "audit", "authenticator", "controllerManager", "scheduler"]

  vpc_config {
    security_group_ids = [aws_security_group.hh-fc-k8s4dev-sg-eks-cluster.id]
    subnet_ids         = ["subnet-06891e5a7b4742071","subnet-09869431922bdc2d3"] # 생성해야  ID 를 만들수 있음. 콘솔에서 가져와야 함. 
    endpoint_public_access = true
  }


}