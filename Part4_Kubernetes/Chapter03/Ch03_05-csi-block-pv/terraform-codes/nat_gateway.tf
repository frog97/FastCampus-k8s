resource "aws_nat_gateway" "hhtest-nat-gateway" {

  depends_on = [
    aws_eip.hhtest-elastic-ip
  ]

  allocation_id     = aws_eip.hhtest-elastic-ip.id
  subnet_id         = aws_subnet.hhtest-public-subnet3.id
  connectivity_type = "public"

  tags = {
    Name        = "hhtest-nat-gateway"
  }

  tags_all = {
    Name        = "hhtest-nat-gateway"
  }

}
