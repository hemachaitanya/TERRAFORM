provider "aws" {
  region = "us-east-1"

}
module "vpc_example_simple-vpc" {
  source          = "terraform-aws-modules/vpc/aws"
  name            = "myvpc"
  cidr            = "12.12.0.0/16"
  azs             = ["us-east-1a", "us-east-1b"]
  private_subnets = ["12.12.1.0/24", "12.12.2.0/24"]
  public_subnets  = ["12.12.101.0/24", "12.12.102.0/24"]

  enable_nat_gateway = false
  enable_vpn_gateway = false

  tags = {
    Terraform   = "true"
    Environment = "dev"
  }

}
  