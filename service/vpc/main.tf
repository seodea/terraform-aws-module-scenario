# vpc module

module "vpc" {
    #source = "../../module/vpc"
    source = "git::https://github.com/seodea/terraform-AWS-module-scenario//module/vpc"

    company = var.company

    environment = "tf-test"
    
    region = "ap-northeast-2"
    
    zone_1 = "a"
    
    zone_2 = "c"
    
    vpc_cidr = "10.0.0.0/16"
    
    public_cidr = "10.0.0.0/24"
    
    private_cidr_1 = "10.0.100.0/24"
    
    private_cidr_2 = "10.0.101.0/24"
    
}
