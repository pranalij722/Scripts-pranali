# Create a Route in the Route Table to allow Internet access
resource "aws_route" "Final_Banking_Project_Route" {
  route_table_id         = aws_route_table.Final_Banking_Project_Route_Table.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.Final_Banking_Project_IGW.id
}
