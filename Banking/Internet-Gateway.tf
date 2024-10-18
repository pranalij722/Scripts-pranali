# Create Internet Gateway
resource "aws_internet_gateway" "Final_Banking_Project_IGW" {
  vpc_id = aws_vpc.Final_Banking_Project_VPC.id
  tags = {
    Name = "Final_Banking-Project-InternetGateway"
  }
}
