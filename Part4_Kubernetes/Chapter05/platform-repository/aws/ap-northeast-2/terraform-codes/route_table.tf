resource "aws_route_table" "testhh-route-table-pub-sub1" {

  depends_on = [
    aws_vpc.testhh-vpc,
    aws_internet_gateway.testhh-internet-gateway
  ]

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.testhh-internet-gateway.id
  }

  tags = {
    Name = "testhh-route-table-pub-sub1"
  }

  tags_all = {
    Name = "testhh-route-table-pub-sub1"
  }

  vpc_id = aws_vpc.testhh-vpc.id
}

resource "aws_route_table" "testhh-route-table-pub-sub3" {

  depends_on = [
    aws_vpc.testhh-vpc,
    aws_internet_gateway.testhh-internet-gateway
  ]

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.testhh-internet-gateway.id
  }

  tags = {
    Name = "testhh-route-table-pub-sub3"
  }

  tags_all = {
    Name = "testhh-route-table-pub-sub3"
  }

  vpc_id = aws_vpc.testhh-vpc.id
}
