module "vpc" {
  source   = "../../modules/VPC"
  vpc_cidr = var.vpc_cidr

}