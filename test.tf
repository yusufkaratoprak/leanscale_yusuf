#OpenShot Terraform Project
provider "aws" {
  region  = "eu-west-2"
}

resource "aws_s3_bucket" "b1" {
  bucket = "my-tf-test-bucket-leanscale-2"
  acl    = "private"

  tags = {
    Name        = "My bucket-2"
    Environment = "Dev"
  }
}

