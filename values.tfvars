provid = {
  region = "us-east-1"
}
myvpc = {
  Name       = "chaitu"
  cidr_block = "10.10.0.0/16"
}
mysubnet = {
  Name       = "mysub"
  cidr_block = "10.10.0.0/24"

}
mysg = {
  name        = "https"
  description = "open http and ssh "
  Name        = "mysgroup"
}
