provider "local" {
  
}
resource "local_file" "hema" {
  content  = "hai chaitu i am ur hema"
  filename = "${path.module}/hema.txt"
}



