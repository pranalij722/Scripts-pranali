# Create Subnet
resource "aws_subnet" "Final_Banking_Project_Subnet" {
  vpc_id            = aws_vpc.Final_Banking_Project_VPC.id
  cidr_block        = "10.0.1.0/24"
  availability_zone = "us-east-2a"
  tags = {
    Name = "Final_Banking-Project-Subnet"
  }
}
