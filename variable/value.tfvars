provid = {
  region = "us-east-1"
}
localvpc = {
  Name       = "chaitu"
  cidr_block = "10.0.0.0/16"
}
localsub = {
  Name       = ["web1","web2","web3","web4","web5","web6"]
  cidr_block = ["10.0.0.0/24","10.0.1.0/24","10.0.2.0/24","10.0.3.0/24","10.0.4.0/24","10.0.5.0/24"]
}