provider "aws" {
  region = "us-west-1"
  alias = "primary"
}
provider "aws" {
    region = "ap-south-1"
    alias = "secondary"
}

resource "aws_vpc" "privatevpc" {
  provider = aws.primary
  cidr_block = "10.0.0.0/16"
  tags = {
    Name = "vpc0"
  }

}
resource "aws_vpc" "privatevpc1" {
  provider = aws.secondary
  cidr_block = "10.1.0.0/16"
  tags = {
    Name = "vpc1"
  }
}
resource "aws_subnet" "privatesubnet" {
    provider = aws.primary
  vpc_id     = aws_vpc.privatevpc.id
  count      = 3
  cidr_block = cidrsubnet("10.0.0.0/16", 8, count.index)

  tags = {
    Name = "sub${count.index}"
  }

}
resource "aws_subnet" "publicsubnet"{
    provider = aws.secondary
    vpc_id = aws_vpc.privatevpc1.id
    count = 3
    cidr_block = cidrsubnet("10.1.0.0/16", 8, count.index)

  tags = {
    Name = "sub${count.index}"
  }
}


