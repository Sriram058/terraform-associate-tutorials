provider "aws" {
  region     = "us-east-1"
  access_key = ""
  secret_key = ""
}

resource "random_pet" "petname" {
  length    = 5
  separator = "-"
}

resource "aws_s3_bucket" "sample" {
  bucket = random_pet.petname.id

  tags = {
    public_bucket = true
  }
}

resource "aws_s3_bucket_acl" "example" {
  bucket = aws_s3_bucket.sample.id
  acl    = "public-read"
}
