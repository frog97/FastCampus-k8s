resource "aws_internet_gateway" "hhtest-internet-gateway" {

  depends_on = [
    aws_vpc.hhtest-vpc
  ]

  vpc_id = aws_vpc.hhtest-vpc.id
}