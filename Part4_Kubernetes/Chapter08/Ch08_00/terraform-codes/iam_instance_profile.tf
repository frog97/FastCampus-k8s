resource "aws_iam_instance_profile" "testhh-ec2-instance-profile2" {
  name = "testhh-ec2-instance-profile2"
  path = "/"
  role = "testhh-iam-role-ec2-instance-bastion2"
}
#여러 권한을 하나로 묶어 둔 것이고 이걸 여러 롤과 매핑 가능