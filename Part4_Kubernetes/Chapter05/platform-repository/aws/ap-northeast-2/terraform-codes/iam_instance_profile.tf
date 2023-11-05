resource "aws_iam_instance_profile" "testhh-ec2-instance-profile" {
  name = "testhh-ec2-instance-profile"
  path = "/"
  role = "testhh-iam-role-ec2-instance-bastion"
}
#여러 권한을 하나로 묶어 둔 것이고 이걸 여러 롤과 매핑 가능