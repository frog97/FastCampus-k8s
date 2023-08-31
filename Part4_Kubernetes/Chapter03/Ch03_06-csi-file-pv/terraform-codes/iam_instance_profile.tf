resource "aws_iam_instance_profile" "hhtest-ec2-instance-profile" {
  name = "hhtest-ec2-instance-profile"
  path = "/"
  role = "hhtest-iam-role-ec2-instance-bastion"
}
