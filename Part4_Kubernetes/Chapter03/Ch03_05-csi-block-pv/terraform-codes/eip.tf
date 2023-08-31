resource "aws_eip" "hhtest-elastic-ip" {
  network_border_group = "ap-northeast-2"
  public_ipv4_pool     = "amazon"

  tags = {
    Name        = "hhtest-elastic-ip"
  }

  tags_all = {
    Name        = "hhtest-elastic-ip"
  }

  vpc = true
}
