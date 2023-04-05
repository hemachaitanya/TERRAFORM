variable "provid" {
  type = object({
    region = string
  })

}
variable "myvpc" {
  type = object({
    Name       = string
    cidr_block = string
  })

}
variable "mysubnet" {
  type = object({
    cidr_block = string
    Name       = string
  })

}
variable "mysg" {
  type = object({
    name        = string
    description = string
    Name        = string
  })

}