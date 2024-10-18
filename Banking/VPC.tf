# Create VPC
resource "aws_vpc" "Final_Banking_Project_VPC" {
  cidr_block = "10.0.0.0/16"
  tags = {
    Name = "Final_Banking-Project-VPC"
  }
}
