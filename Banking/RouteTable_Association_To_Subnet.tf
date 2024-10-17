# Associate Route Table with Subnet
resource "aws_route_table_association" "Banking_Project_RTA" {
  subnet_id      = aws_subnet.Banking_Project_Subnet.id
  route_table_id = aws_route_table.Banking_Project_Route_Table.id
}
