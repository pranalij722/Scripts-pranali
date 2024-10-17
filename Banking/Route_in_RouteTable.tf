# Create a Route in the Route Table to allow Internet access
resource "aws_route" "Banking_Project_Route" {
  route_table_id         = aws_route_table.Banking_Project_Route_Table.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.Banking_Project_IGW.id
}
