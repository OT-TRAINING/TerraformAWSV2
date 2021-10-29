module "Prod" {
  source  = "../module/infra"
  environment = "Prod"
  vpc_cidr      = "10.0.0.0/16"
  pub_sub1_cidr = "10.0.1.0/24"
  pub_sub2_cidr = "10.0.2.0/24"
  pvt_sub1_cidr = "10.0.3.0/24"
  pvt_sub2_cidr = "10.0.4.0/24"
}