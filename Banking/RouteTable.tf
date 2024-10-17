# Create Route Table
resource "aws_route_table" "Banking_Project_Route_Table" {
  vpc_id = aws_vpc.Banking_Project_VPC.id
  tags = {
    Name = "Banking-Project-RouteTable"
  }
}
