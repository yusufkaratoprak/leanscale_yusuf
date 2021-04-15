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

data "aws_ami" "ubuntu2" {
  most_recent = true

  filter {
    name   = "name2"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }

  filter {a
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}


resource "aws_instance" "web2" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = "t2.micro"

  tags = {
    Name = "HelloWorld-leanscale-2"
  }
}