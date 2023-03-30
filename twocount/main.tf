provider "aws" {
    region = "us-east-1"
  
}
resource "aws_vpc" "ntier" {
    count = 2
    cidr_block = "10.${count.index}.0.0/16"
    tags = {
        Name = "vpc(count.index)"
    }
}
resource "aws_subnet" "ntiersub" {
    vpc_id = aws_vpc.ntier[0].id
    count = 3
    cidr_block = cidrsubnet("10.0.0.0/16", 8, count.index)
    tags = {
      Name = "sub${count.index}"
    }
  
}
resource "aws_subnet" "ntiersubnet" {
    vpc_id = aws_vpc.ntier[1].id
    count = 3
    cidr_block = cidrsubnet("10.1.0.0/16", 8, count.index)
    tags = {
      Name = "sub${count.index}"
    }
  
}
