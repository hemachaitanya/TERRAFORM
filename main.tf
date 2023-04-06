provider "aws" {
    region = "us-east-1"
  
}
resource "aws_instance" "chaitu" {
    ami = "ami-007855ac798b5175e"
    instance_type = "t2.micro"
    subnet_id = "subnet-0fa7d44855a8c8a50"
    key_name = "hema"

}