resource "aws_security_group" "hhtest-sg-eks-cluster" {
  name        = "hhtest-sg-eks-cluster"
  description = "security_group for hhtest-eks-cluster"
  vpc_id      = aws_vpc.hhtest-vpc.id

  tags = {
    Name = "hhtest-sg-eks-cluster"
  }
}

resource "aws_security_group_rule" "hhtest-sg-eks-cluster-ingress" {

  security_group_id = aws_security_group.hhtest-sg-eks-cluster.id
  type              = "ingress"
  description       = "ingress security_group_rule for hhtest-eks-cluster"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  cidr_blocks       = ["0.0.0.0/0"]
}

resource "aws_security_group_rule" "hhtest-sg-eks-cluster-egress" {

  security_group_id = aws_security_group.hhtest-sg-eks-cluster.id
  type              = "egress"
  description       = "egress security_group_rule for hhtest-eks-cluster"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  cidr_blocks       = ["0.0.0.0/0"]
}

########################### EKS Pods Security Group #############3

resource "aws_security_group" "hhtest-sg-eks-pods" {
  name        = "hhtest-sg-eks-pods"
  description = "security_group for hhtest-eks-pods"
  vpc_id      = aws_vpc.hhtest-vpc.id

  tags = {
    Name = "hhtest-sg-eks-pods"
  }
}

resource "aws_security_group_rule" "hhtest-sg-eks-pods-ingress" {

  security_group_id = aws_security_group.hhtest-sg-eks-pods.id
  type              = "ingress"
  description       = "ingress security_group_rule for hhtest-eks-pods"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  cidr_blocks       = ["0.0.0.0/0"]
}

resource "aws_security_group_rule" "hhtest-sg-eks-pods-egress" {

  security_group_id = aws_security_group.hhtest-sg-eks-pods.id
  type              = "egress"
  description       = "egress security_group_rule for hhtest-eks-pods"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  cidr_blocks       = ["0.0.0.0/0"]
}