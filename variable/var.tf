variable "providername" {
    type = object ({
        region = string
    })
  
}
variable "vpc1" {
    type = object({
        cidr_block = list(string)
        Name =list(string)
    })
  
}

variable "sub1" {
    type = ({
        cidr_block = list(string)
        Name = list(sting)
    })
  
}