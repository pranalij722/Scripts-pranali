# Create Route Table
resource "aws_route_table" "Final_Banking_Project_Route_Table" {
  vpc_id = aws_vpc.Final_Banking_Project_VPC.id
  tags = {
    Name = "Final_Banking-Project-RouteTable"
  }
}
