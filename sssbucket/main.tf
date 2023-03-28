provider "aws" {
  
}
resource "aws_s3_bucket" "hemuchaitu203" {
  bucket = "hemu-tf-test-bucket"

  tags = {
    Name        = "hemuchaitu203"
    Environment = "Dev"
  }
}

resource "aws_s3_bucket_acl" "example" {
  bucket = aws_s3_bucket.hemuchaitu203.id
  acl    = "private"
}