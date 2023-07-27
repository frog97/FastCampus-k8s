resource "aws_security_group" "hh-fc-k8s4dev-sg-eks-cluster" {
  name        = "hh-fc-k8s4dev-sg-eks-cluster"
  description = "security_group for test-eks-cluster"
  vpc_id      = "vpc-0a7b13a3f4c264b0f"

  tags = {
    Name = "hh-fc-k8s4dev-sg-eks-cluster"
  }
}

resource "aws_security_group_rule" "hh-fc-k8s4dev-sg-eks-cluster-ingress" {

  security_group_id = aws_security_group.hh-fc-k8s4dev-sg-eks-cluster.id
  type              = "ingress"
  description       = "ingress security_group_rule for hh-fc-k8s4dev-eks-cluster"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  cidr_blocks       = ["0.0.0.0/0"]
}

resource "aws_security_group_rule" "hh-fc-k8s4dev-sg-eks-cluster-egress" {

  security_group_id = aws_security_group.hh-fc-k8s4dev-sg-eks-cluster.id
  type              = "egress"
  description       = "egress security_group_rule for hh-fc-k8s4dev-eks-cluster"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  cidr_blocks       = ["0.0.0.0/0"]
}