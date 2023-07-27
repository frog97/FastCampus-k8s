resource "aws_route_table" "hhtest-route-table-pub-sub1" {

  depends_on = [
    aws_vpc.hhtest-vpc,
    aws_internet_gateway.hhtest-internet-gateway
  ]

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.hhtest-internet-gateway.id
  }

  tags = {
    Name = "hhtest-route-table-pub-sub1"
  }

  tags_all = {
    Name = "hhtest-route-table-pub-sub1"
  }

  vpc_id = aws_vpc.hhtest-vpc.id
}

resource "aws_route_table" "hhtest-route-table-pub-sub3" {

  depends_on = [
    aws_vpc.hhtest-vpc,
    aws_internet_gateway.hhtest-internet-gateway
  ]

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.hhtest-internet-gateway.id
  }

  tags = {
    Name = "hhtest-route-table-pub-sub3"
  }

  tags_all = {
    Name = "hhtest-route-table-pub-sub3"
  }

  vpc_id = aws_vpc.hhtest-vpc.id
}

resource "aws_route_table" "hhtest-default-route-table" {

  depends_on = [
    aws_vpc.hhtest-vpc,
    aws_internet_gateway.hhtest-internet-gateway
  ]

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.hhtest-internet-gateway.id
  }

  tags = {
    Name = "hhtest-default-route-table"
  }

  tags_all = {
    Name = "hhtest-default-route-table"
  }

  vpc_id = aws_vpc.hhtest-vpc.id
}


resource "aws_route_table" "hhtest-route-table-pub-eks-pods-a" {

  depends_on = [
    aws_vpc.hhtest-vpc,
    aws_internet_gateway.hhtest-internet-gateway
  ]

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.hhtest-internet-gateway.id
  }

  tags = {
    Name = "hhtest-route-table-pub-eks-pods-a"
  }

  tags_all = {
    Name = "hhtest-route-table-pub-eks-pods-a"
  }

  vpc_id = aws_vpc.hhtest-vpc.id
}


resource "aws_route_table" "hhtest-route-table-pub-eks-pods-c" {

  depends_on = [
    aws_vpc.hhtest-vpc,
    aws_internet_gateway.hhtest-internet-gateway
  ]

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.hhtest-internet-gateway.id
  }

  tags = {
    Name = "hhtest-route-table-pub-eks-pods-c"
  }

  tags_all = {
    Name = "hhtest-route-table-pub-eks-pods-c"
  }

  vpc_id = aws_vpc.hhtest-vpc.id
}