resource "aws_internet_gateway" "testhh-internet-gateway" {

  depends_on = [
    aws_vpc.testhh-vpc
  ]

  vpc_id = aws_vpc.testhh-vpc.id
}