module "my_ec2" {
    source = "./modules/ec2"
    ami_id = "ami-0198a868663199764"
    sg_ids = [module.security_group.sg_id]
}

module "security_group" {
    source = "./modules/sg"
}