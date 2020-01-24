provider "aws" {
    region                  = var.aws_region
    shared_credentials_file = var.credentials
    profile                 = var.profile
}

module "network" {
  source = "./modules/networking"
}

module "iam" {
  source = "./modules/iam"
}

module "compute" {
  source = "./modules/compute"
  public_subnet_id = module.network.public_subnet_id
  open_sg_id  = module.network.open_sg_id
  master_profile  = module.iam.master_profile
  node_profile  = module.iam.node_profile
}