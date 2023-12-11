resource "aws_route_table_association" "testhh-route-association-pub-sub1" {
  route_table_id = aws_route_table.testhh-route-table-pub-sub1.id
  subnet_id      = aws_subnet.testhh-public-subnet1.id
}

resource "aws_route_table_association" "testhh-route-association-pub-sub3" {
  route_table_id = aws_route_table.testhh-route-table-pub-sub3.id
  subnet_id      = aws_subnet.testhh-public-subnet3.id
}