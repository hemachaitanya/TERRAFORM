provider "aws" {
  region = "us-east-1"

}
resource "aws_vpc" "hema" {
    cidr_block = "122.122.0.0/16"
    tags ={
        name = "myvpc"
    }
  
}
resource "aws_subnet" "sub" {
    vpc_id = aws_vpc.hema.id
    cidr_block = "122.122.0.0/24"
    tags = {
      name = "subnethema"
    }
  
}
resource "aws_security_group" "allow_tls" {
  name        = "sgall"
  description = "Allow TLS inbound traffic"
  vpc_id      = aws_vpc.hema.id

  ingress {
    description      = "TLS from VPC"
    from_port        = 80 
    to_port          = 3306
    protocol         = "tcp"
    cidr_blocks      = [aws_vpc.hema.cidr_block]
  }

}