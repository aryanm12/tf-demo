module "my_ec2" {
    source = "github.com/aryanm12/tf-demo//modules/ec2?ref=main"
    ami_id = "ami-0198a868663199764"
}