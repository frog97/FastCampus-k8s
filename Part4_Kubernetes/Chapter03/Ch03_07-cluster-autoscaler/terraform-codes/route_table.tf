
########## Public Subnet Route Tables ########## 

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


########## Private Subnet Route Tables ########## 

resource "aws_route_table" "hhtest-route-table-pri-sub1" {

  depends_on = [
    aws_vpc.hhtest-vpc,
    aws_nat_gateway.hhtest-nat-gateway
  ]

  route {
    cidr_block = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.hhtest-nat-gateway.id
  }

  tags = {
    Name = "hhtest-route-table-pri-sub1"
  }

  tags_all = {
    Name = "hhtest-route-table-pri-sub1"
  }

  vpc_id = aws_vpc.hhtest-vpc.id
}

resource "aws_route_table" "hhtest-route-table-pri-sub3" {

  depends_on = [
    aws_vpc.hhtest-vpc,
    aws_nat_gateway.hhtest-nat-gateway
  ]

  route {
    cidr_block = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.hhtest-nat-gateway.id
  }

  tags = {
    Name = "hhtest-route-table-pri-sub3"
  }

  tags_all = {
    Name = "hhtest-route-table-pri-sub3"
  }

  vpc_id = aws_vpc.hhtest-vpc.id
}
