############ eks cluster iam role ############

resource "aws_iam_role" "testhh-iam-role-eks-cluster" {
  name = "testhh-iam-role-eks-cluster"

  assume_role_policy = <<POLICY
{
"Version": "2012-10-17",
"Statement": [
    {
    "Effect": "Allow",
    "Principal": {
        "Service": "eks.amazonaws.com"
    },
    "Action": "sts:AssumeRole"
    }
]
}
POLICY
}

resource "aws_iam_role_policy_attachment" "testhh-iam-policy-eks-cluster" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSClusterPolicy"
  role       = aws_iam_role.testhh-iam-role-eks-cluster.name
}

resource "aws_iam_role_policy_attachment" "testhh-iam-policy-eks-cluster-vpc" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSVPCResourceController"
  role       = aws_iam_role.testhh-iam-role-eks-cluster.name
}


############ eks nodegroup iam role ############

resource "aws_iam_role" "testhh-iam-role-eks-nodegroup" {
  name = "testhh-iam-role-eks-nodegroup"

  assume_role_policy = <<POLICY
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": {
        "Service": "ec2.amazonaws.com"
      },
      "Action": "sts:AssumeRole"
    }
  ]
}
POLICY
}

resource "aws_iam_role_policy_attachment" "testhh-iam-policy-eks-nodegroup" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSWorkerNodePolicy"
  role       = aws_iam_role.testhh-iam-role-eks-nodegroup.name
}

resource "aws_iam_role_policy_attachment" "testhh-iam-policy-eks-nodegroup-cni" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKS_CNI_Policy"
  role       = aws_iam_role.testhh-iam-role-eks-nodegroup.name
}

resource "aws_iam_role_policy_attachment" "testhh-iam-policy-eks-nodegroup-ecr" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryReadOnly"
  role       = aws_iam_role.testhh-iam-role-eks-nodegroup.name
}

############ bastion ec2 instance iam role ############

resource "aws_iam_role" "testhh-iam-role-ec2-instance-bastion" {
  assume_role_policy = <<POLICY
{
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Effect": "Allow",
      "Principal": {
        "Service": "ec2.amazonaws.com"
      }
    }
  ],
  "Version": "2012-10-17"
}
POLICY
  name                 = "testhh-iam-role-ec2-instance-bastion"
  description          = "Iam role for bastion ec2 instance."
  max_session_duration = "3600"
  path                 = "/"

  tags = {
    Name        = "testhh-iam-role-ec2-instance-bastion"
  }

  tags_all = {
    Name        = "testhh-iam-role-ec2-instance-bastion"
  }
}

resource "aws_iam_role_policy_attachment" "testhh-iam-role-ec2-instance-bastion_att" {
  role       = aws_iam_role.testhh-iam-role-ec2-instance-bastion.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AmazonEC2RoleforSSM"
}