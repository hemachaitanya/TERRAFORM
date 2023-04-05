variable "ntier_cidr" {
  type    = string
  default = "10.10.0.0/16"
}
variable "ntier_subnet_zones" {
  default = ["us-east-1a", "us-east-1b", "us-east-1a"]
}
variable "ntier_subnet_tags" {
  default = ["test1", "test2", "test3"]
}
variable "dev_subnet_indexes" {
  type    = list(number)
  default = [0]
}