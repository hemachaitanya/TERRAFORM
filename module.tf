provider "aws" {
    region = "us-east-1"
    alias = "ram"
  
}
provider "aws" {
    region = "us-west-1"
    alias = "bheem"
  
}
module "vpc" {
    provider = aws.ram
    source  = "terraform-aws-modules/vpc/aws"
    cidr = "11.1.0.0/16"
    
    tags = {
        Name = "ram"
    }
  
}
module "vpc1" {
    provider = aws.bheem
    source  = "terraform-aws-modules/vpc/aws"
    cidr = "11.10.0/16"
    
    tags = {
        Name = "rama"
    }
  
}
