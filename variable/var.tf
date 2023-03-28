variable "provid" {
  type = object({
    region = string
  })
}
variable "localvpc" {
  type = object({
    cidr_block = string
    Name       = string
  })

}
variable "localsub" {
  type = object({
    cidr_block = list(string)
    Name       = list(string)
  })

}