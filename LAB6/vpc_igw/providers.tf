provider "aws" {
  region = "us-east-1"
    access_key = "AKIAQ2FGGJ4U7SHORPV6"
    secret_key = "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"
}

terraform {
  backend "s3" {
    bucket         = "terraform-training-ot"
    key            = "startrek/vpc_igw.tfstate"
    region         = "us-east-1"
    access_key = "AKIAQ2FGGJ4U7SHORPV6"
    secret_key = "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"
  }
}

