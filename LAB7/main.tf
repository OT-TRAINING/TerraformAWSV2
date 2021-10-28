module "Dev" {
  source  = "./Dev"
  environment = "Dev"
}

module "QA" {
  source  = "./QA"
  environment = "QA"     
}

module "Production" {
  source  = "./Production"
  environment = "Production"
  instance_type = "t2.micro"
  vpc_cidr      = "10.0.0.0/16"
  pub_sub1_cidr = "10.0.1.0/24"
  pub_sub2_cidr = "10.0.2.0/24"
  pvt_sub1_cidr = "10.0.3.0/24"
  pvt_sub2_cidr = "10.0.4.0/24"
}
