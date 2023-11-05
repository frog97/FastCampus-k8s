
resource "aws_security_group" "testhh-sg-eks-cluster" {
  name        = "testhh-sg-eks-cluster"
  description = "security_group for testhh-eks-cluster"
  vpc_id      = aws_vpc.testhh-vpc.id

  tags = {
    Name = "testhh-sg-eks-cluster"
  }
}

resource "aws_security_group_rule" "testhh-sg-eks-cluster-ingress" {

  security_group_id = aws_security_group.testhh-sg-eks-cluster.id
  type              = "ingress"
  description       = "ingress security_group_rule for testhh-eks-cluster"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  cidr_blocks       = ["0.0.0.0/0"]
}

resource "aws_security_group_rule" "testhh-sg-eks-cluster-egress" {

  security_group_id = aws_security_group.testhh-sg-eks-cluster.id
  type              = "egress"
  description       = "egress security_group_rule for testhh-eks-cluster"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  cidr_blocks       = ["0.0.0.0/0"]
}