provider "aws" {
    region = ""
  
}

resource "aws_vpc" "vpc1" {
    cidr_block = ""
    tags = {
      "Name" = ""
    }
  
}
resource "aws_subnet" "sub1" {
    vpc_id = aws_vpc.vpc1.id
    cidr_block = ""
    tags = {
      "key" = ""
    }
  
}