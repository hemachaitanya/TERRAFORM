resource "aws_vpc" "ntiervpc" {
  cidr_block = var.ntier_cidr
  tags = {
    "Name" = "ntier"
  }
}
resource "aws_subnet" "subnets" {
  count             = length(var.ntier_subnet_zones)
  cidr_block        = cidrsubnet(var.ntier_cidr, 8, count.index)
  availability_zone = var.ntier_subnet_zones[count.index]
  tags = {
    "Name" = var.ntier_subnet_tags[count.index]
  }
  vpc_id = aws_vpc.ntiervpc.id
  depends_on = [
    aws_vpc.ntiervpc
  ]
}
resource "aws_internet_gateway" "ntierig" {
  vpc_id = aws_vpc.ntiervpc.id
  tags = {
    "Name" = "ntier-ig"
  }
  depends_on = [
    aws_vpc.ntiervpc
  ]
}
resource "aws_route_table" "public" {
  vpc_id = aws_vpc.ntiervpc.id
  route  = []
  tags = {
    "Name" = "ntier-public"
  }
  depends_on = [
    aws_vpc.ntiervpc,
    aws_subnet.subnets
  ]
}
resource "aws_route" "publicroute" {
  route_table_id         = aws_route_table.public.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.ntierig.id
}
resource "aws_route_table_association" "publicrtassociations" {
  count          = length(var.dev_subnet_indexes)
  subnet_id      = aws_subnet.subnets[var.dev_subnet_indexes[count.index]].id
  route_table_id = aws_route_table.public.id
}
resource "aws_security_group" "test" {
  name        = "openhttp"
  description = "Open http and ssh"
  vpc_id      = aws_vpc.ntiervpc.id
  tags = {
    "Name" = "sgtest"
  }
  depends_on = [
    aws_vpc.ntiervpc,
    aws_subnet.subnets
  ]
}

resource "aws_vpc" "myvpc" {
    cidr_block = "10.0.0.0/16"
    tags = {
        Name = "myvpc"
    }
  
}
resource "aws_security_group" "allports" {
     name        = "allow_tls"
  description = "Allow TLS inbound traffic"
  vpc_id      = aws_vpc.myvpc.id

  ingress {
    description      = "TLS from VPC"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = [aws_vpc.myvpc.cidr_block]
  }
  ingress {
    description      = "TLS from VPC"
    from_port        = 8080
    to_port          = 8080
    protocol         = "tcp"
    cidr_blocks      = [aws_vpc.myvpc.cidr_block]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "allow_tls"
  }
}
  

resource "aws_instance" "terraformserver" {
  ami                         = "ami-007855ac798b5175e"
  instance_type               = "t2.micro"
  associate_public_ip_address = true
  vpc_security_group_ids      = [aws_security_group.test.id]
  subnet_id                   = aws_subnet.subnets[0].id
  depends_on = [
    aws_vpc.ntiervpc,
    aws_subnet.subnets,
    aws_security_group.test,
    aws_route_table.public
  ]
  tags = {
    Name = "computeEngine"
  }
}
resource "aws_key_pair" "raj" {
  key_name   = "aws_key"
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDEsFzihLcBbc8SaQnXPu+Ycj06ati5mYh0qTrDT2tbOs0UXoosan6XG8EY/ij60nwvVp0FOe3g6skaTG1UmzkTLwRLuHTuO/44GG19y4CyR08EukUpjd1RBdKpeIUQa+cQgVhioSMi3AcHFmojw/J/HMbW7GPTtW8G1PkdeVRR09VAwQj3tVN4+WxU73kGOnPNQ0DZU7Ldj20mPfS3jdTTWV4Upu0HiFi6kIPYXE6V2Vzo0+rJeEZ3TzEkk/gObv7OfYOWf0Oq17Hr+PETvJ9i12DITlig2iebwexQushdaLFxIuxluSyjRxZRIAWwAgANhPgflYF+0N5GJif+4Z/OK5MnZxCEY1WWk6B5lb6U3JWOCRkTzH3IThkuQ632sADpDlEE3ysfTdmfM/5eLww2Q7GPc3IrfKaDpoxOeYPT4VvsmqNutAlIT0bB8PWOt9ck8DGYeAGpR6OffioIIOKZXGZvojhRrACsjkIY+uWuCHHTJyCNo5t0gD9UCuo+OqM= dell@DESKTOP-8TV6TUU"
}