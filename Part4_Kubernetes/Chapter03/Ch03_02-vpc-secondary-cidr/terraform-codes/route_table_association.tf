resource "aws_route_table_association" "hhtest-route-association-pub-sub1" {
  route_table_id = aws_route_table.hhtest-route-table-pub-sub1.id
  subnet_id      = aws_subnet.hhtest-public-subnet1.id
}

resource "aws_route_table_association" "hhtest-route-association-pub-sub3" {
  route_table_id = aws_route_table.hhtest-route-table-pub-sub3.id
  subnet_id      = aws_subnet.hhtest-public-subnet3.id
}


resource "aws_route_table_association" "hhtest-route-association-pub-sub-eks-pods-a" {
  route_table_id = aws_route_table.hhtest-route-table-pub-eks-pods-a.id
  subnet_id      = aws_subnet.hhtest-public-subnet-eks-pods-a.id
}

resource "aws_route_table_association" "hhtest-route-association-pub-sub-eks-pods-c" {
  route_table_id = aws_route_table.hhtest-route-table-pub-eks-pods-c.id
  subnet_id      = aws_subnet.hhtest-public-subnet-eks-pods-c.id
}
