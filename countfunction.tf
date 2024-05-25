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


### length function
# Create subnets
variable "subnet_cidr_blocks" {
  default = [
    "10.0.1.0/24",
    "10.0.2.0/24",
    "10.0.3.0/24",
    "10.0.4.0/24",
    "10.0.5.0/24",
    "10.0.6.0/24"
  ]
}

resource "aws_subnet" "my_subnets" {
  count           = length(var.subnet_cidr_blocks)
  vpc_id          = aws_vpc.my_vpc.id
  cidr_block      = var.subnet_cidr_blocks[count.index]
  availability_zone = "your_availability_zone" # Specify the availability zone here
}

