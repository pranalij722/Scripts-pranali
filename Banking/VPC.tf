# Create VPC
resource "aws_vpc" "Banking_Project_VPC" {
  cidr_block = "10.0.0.0/16"
  tags = {
    Name = "Banking-Project-VPC"
  }
}
