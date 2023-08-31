########### EFS Security Group ###########

resource "aws_security_group" "hhtest-sg-efs" {
  description = "Test EFS security group"

  egress {
    cidr_blocks = ["0.0.0.0/0"]
    from_port   = "0"
    protocol    = "-1"
    self        = "false"
    to_port     = "0"
  }

  ingress {
    cidr_blocks = ["0.0.0.0/0"]
    from_port   = "2049"
    protocol    = "tcp"
    self        = "false"
    to_port     = "2049"
  }

  name   = "hhtest-sg-efs"
  vpc_id = aws_vpc.hhtest-vpc.id
}

########### EKS Security Group ###########

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

########### Bastion (EC2 Instance) Security Group ###########

resource "aws_security_group" "hhtest-sg-bastion" {

  name   = "hhtest-sg-bastion"
  vpc_id = aws_vpc.hhtest-vpc.id

  ingress {
    cidr_blocks = ["0.0.0.0/0"]
    description = "ingress security_group_rule for bastion"
    from_port   = "22"
    protocol    = "tcp"
    self        = "false"
    to_port     = "22"
  }

  egress {
    cidr_blocks = ["0.0.0.0/0"]
    description = "egress security_group_rule for bastion"
    from_port   = "0"
    protocol    = "tcp"
    self        = "false"
    to_port     = "65535"
  }

  tags = {
    Name = "hhtest-sg-bastion"
  }
}
