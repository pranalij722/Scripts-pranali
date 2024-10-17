# Create Subnet
resource "aws_subnet" "Banking_Project_Subnet" {
  vpc_id            = aws_vpc.Banking_Project_VPC.id
  cidr_block        = "10.0.1.0/24"
  availability_zone = "ap-south-1a"
  tags = {
    Name = "Banking-Project-Subnet"
  }
}
