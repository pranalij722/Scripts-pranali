# Create Internet Gateway
resource "aws_internet_gateway" "Banking_Project_IGW" {
  vpc_id = aws_vpc.Banking_Project_VPC.id
  tags = {
    Name = "Banking-Project-InternetGateway"
  }
}
