variable "filename" {
    type = list(string)
}
variable "fileinfo" {
    type = map(object({
        name = string
        content = string
    }))
    default = {
    "first" = {
      content = "first"
      name    = "1.txt"
    },
    "second" = {
      content = "second"
      name    = "2.txt"
    }
  }

}
  

