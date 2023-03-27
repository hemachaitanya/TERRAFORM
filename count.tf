resource "aws_vpc" "awsvpc" {
  cidr_block       = "192.163.0.0/16"
  instance_tenancy = "default"
  tags = {
    Name = "vpc"
  }
}
resource "aws_subnet" "awssub" {
  vpc_id     = aws_vpc.awsvpc.id
  count      = 6
  cidr_block = cidrsubnet("192.163.0.0/16", 8, count.index)
  tags = {
    Name = "sub$(count.index)"
  }
  depends_on = [
    aws_vpc.awsvpc
  ]

}

