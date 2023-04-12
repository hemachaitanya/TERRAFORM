provider "aws" {
  region = "us-east-1"
}
resource "aws_lb" "ll" {
  vpc_id              = "vpc-0abf32b733176b711"
  route_table_ids     = "rtb-028a90a2cc44acc33"
  internet_gateway_id = "rtb-028a90a2cc44acc33"
  availability_zones  = ["us-east-1a", "us-east-1b"]
  subnet_ids          = ["subnet-0cde1d96ac1f062d5", "subnet-0d2c832a1d2fa44f5"]
  instance_ids        = ["i-04e396a03efa219e9", "i-07b5ba4ab2b982b3d"]
}