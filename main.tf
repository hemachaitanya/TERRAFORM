provider "aws" {
  region = var.provid.region

}
resource "aws_vpc" "myvpc" {
  cidr_block = var.myvpc.cidr_block
  tags = {
    Name = var.myvpc.Name
  }

}
resource "aws_subnet" "mysubnet" {
  vpc_id     = local.vpc_id
  cidr_block = var.mysubnet.cidr_block
  tags = {
    Name = var.mysubnet.Name
  }

}
resource "aws_internet_gateway" "myigw" {
  vpc_id = local.vpc_id
  tags = {
    Name = "myigw"
  }
  depends_on = [
    aws_vpc.myvpc
  ]

}
resource "aws_route_table" "subnet" {
  vpc_id    = local.vpc_id
  route     = []
  tags = {
    Name = "myroute"
  }
}
resource "aws_route" "oneroute" {
  route_table_id         = aws_route_table.subnet.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.myigw.id

}
resource "aws_route_table_association" "tworoute" {
  subnet_id      = aws_subnet.mysubnet.id
  route_table_id = local.route_table_id
}
resource "aws_security_group" "mysg" {
  name        = var.mysg.name
  description = var.mysg.description
  vpc_id      = local.vpc_id
  tags = {
    Name = var.mysg.Name
  }

}
resource "aws_security_group_rule" "websghttp" {
  type              = local.type
  from_port         = local.from_port
  to_port           = local.to_port
  protocol          = local.protocol
  cidr_blocks       = local.cidr_blocks
  security_group_id = aws_security_group.mysg.id
}
resource "aws_key_pair" "rr" {
  key_name   = "rr"
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDkWtAjqACrv3UILFkpG1IXh0+Fcn+2wHLF8Yh088cvS2Q7+8Sm2IoQQGhpqvXL4eSJyscn6qxSSRTJyCe6WXOrTR8I9PUfR1Fqj3fiWe4+WmhYsyK21IrDzsBqgGs8JynhHphKAINuLOIhfsxoRa/3Iz+MED8RKjxejJ6MylkGf/2NgiIET+kEfogXh9rfe+OCuxVpLb3yv7f2Rc8pIrhe4sph3Ix43JlQ2zj9dKxntpczKY+oBbYf2qP0zSCLT6S9cnWYmHFP8X/j1z7qzmtNENxZrnrhUkFlEkiGiYiHyX5HX5f9Aco/RZLoaG7SDfGHmPmQ9xobzC7iYNcxZlb8hX48Mr+hec8Gmvn60omo4uw5KECckwPD/PIW2qe0KcbUNyhYmGv57qbV6eR+nyIPMM8o8wFn86oj8mxOmNCm6SecyDaKLMEEZ7KeK37oD5ozBepDXrIuGkDC4JvU+Sj6vfXNVjirb3/rVi49i810RA0EhJRb+f1nwOAwHbYEs58= dell@DESKTOP-ASAI4ED"
}
resource "aws_instance" "lamp" {
  ami                         = "ami-007855ac798b5175e"
  instance_type               = "t2.micro"
  user_data = file("script.sh")
  associate_public_ip_address = true
  vpc_security_group_ids      = [aws_security_group.mysg.id]
  subnet_id                   = aws_subnet.mysubnet.id
  key_name                    = "rr"
  depends_on = [
    local.vpc_id
  ]
  tags = {
    Name = "hema"
  }

}