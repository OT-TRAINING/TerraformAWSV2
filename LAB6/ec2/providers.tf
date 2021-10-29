provider "aws" {
  region = "us-east-1"
    access_key = "AKIAQ2FGGJ4U7SHORPV6"
    secret_key = "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"
}

terraform {
  backend "s3" {
    bucket         = "terraform-training-ot"
    key            = "startrek/ec2.tfstate"
    region         = "us-east-1"
    access_key = "AKIAQ2FGGJ4U7SHORPV6"
    secret_key = "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"
  }
}

data "terraform_remote_state" "subnets" {
  backend = "s3"
  config = {
    bucket         = "terraform-training-ot"
    key            = "startrek/subnets.tfstate"
    region         = "us-east-1"
    access_key = "AKIAQ2FGGJ4U7SHORPV6"
    secret_key = "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"
  }
}

data "terraform_remote_state" "vpc_igw" {
  backend = "s3"
  config = {
    bucket         = "terraform-training-ot"
    key            = "startrek/vpc_igw.tfstate"
    region         = "us-east-1"
    access_key = "AKIAQ2FGGJ4U7SHORPV6"
    secret_key = "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"
  }
}
