# Create VPC
resource "aws_vpc" "OAPACPUJP_vpc" {
  cidr_block = var.vpc_cidr

  tags = {
    Name = "OAPACPUJP_vpc"
  }
}