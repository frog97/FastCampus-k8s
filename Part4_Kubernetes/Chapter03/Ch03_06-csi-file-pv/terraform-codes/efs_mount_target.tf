resource "aws_efs_mount_target" "hhtest-efs-mount-target1" {

  file_system_id  = aws_efs_file_system.efs-file-system.id
  security_groups = [aws_security_group.hhtest-sg-efs.id]
  subnet_id       = aws_subnet.hhtest-private-subnet1.id
}

resource "aws_efs_mount_target" "hhtest-efs-mount-target3" {

  file_system_id  = aws_efs_file_system.efs-file-system.id
  security_groups = [aws_security_group.hhtest-sg-efs.id]
  subnet_id       = aws_subnet.hhtest-private-subnet3.id
}