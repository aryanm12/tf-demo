module "vpc" {
    source = "./modules/vpc"
    demo_vpc_cidr = var.vpc_cidr
    demo_prv_sub_cidr_01 = var.prv_sub_cidr
}

module "ec2" {
    source = "./modules/ec2"
    ami_id = "35363783"
    instance = var.instance_configurations
}