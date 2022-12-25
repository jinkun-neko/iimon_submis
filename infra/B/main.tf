variable "access_key" {}
variable "secret_key" {}

terraform {
  backend "local" {
    path = "./terraform.tfstate"
  }
}

provider "aws" {
  access_key = var.access_key
  secret_key = var.secret_key
  region     = "ap-northeast-1"

  s3_use_path_style = true 

  endpoints {
    s3  = "http://localhost:4566"
    sts = "http://localhost:4566"
  }
}

resource "aws_s3_bucket" "testing_bucket" {
  bucket = "testing"

  tags = {
    Name        = "Yay"
    Environment = "Dev"
  }
}

resource "aws_s3_bucket_acl" "testing_bucket_acl" {
  bucket = aws_s3_bucket.testing_bucket.id
  acl    = "private"
}