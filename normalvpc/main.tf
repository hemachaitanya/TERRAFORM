resource "aws_vpc" "hema" {
  cidr_block = "10.0.0.0/16"
  tags = {
    Name = "chaitu"
  }
}
resource "aws_subnet" "sub1" {
  vpc_id     = aws_vpc.hema.id
  cidr_block = "10.0.0.0/24"
  tags = {
    Name = "sub0"
  }
}
resource "aws_subnet" "sub2" {
  vpc_id     = aws_vpc.hema.id
  cidr_block = "10.0.1.0/24"
  tags = {
    Name = "sub1"
  }
}
resource "aws_subnet" "sub3" {
  vpc_id     = aws_vpc.hema.id
  cidr_block = "10.0.2.0/24"
  tags = {
    Name = "sub2"
  }
}
resource "aws_subnet" "sub4" {
  vpc_id     = aws_vpc.hema.id
  cidr_block = "10.0.3.0/24"
  tags = {
    Name = "sub3"
  }
}

