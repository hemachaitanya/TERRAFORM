provider "aws" {
    region = "us-east-1"
  
}
resource "aws_instance" "chaitu" {
    ami = "ami-007855ac798b5175e"
    instance_type = "t2.micro"
     provisioner "local-exec" {
    command = "echo ${self.privat"
  }
    subnet_id = "subnet-0fa7d44855a8c8a50"
    security_groups = ["sg-02784235c3338b696"]
    key_name = "hema"

}