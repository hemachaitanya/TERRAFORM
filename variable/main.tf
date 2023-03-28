provider "aws" {
  region = var.provid.region
}
resource "aws_vpc" "localvpc" {
  cidr_block = var.localvpc.cidr_block
  tags = {
    Name =  var.localvpc.Name
  }

}
resource "aws_subnet" "localsub"{
  vpc_id = aws_vpc.localvpc.id
  count  = length(var.localsub.Name)
  cidr_block = var.localsub.cidr_block[count.index]
  tags = {
     Name = var.localsub.Name[count.index]
  }
 
}


