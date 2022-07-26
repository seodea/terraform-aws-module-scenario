# vpc module

module "vpc" {
    source = "../../module/vpc"

    company = var.company

    environment = "tf-test"
    
    region = "ap-northeast-2"
    
    zone_1 = "a"
    
    zone_2 = "c"
    
    vpc_cidr = "10.0.0.0/16"
    
    public_cidr = "10.0.0.0/24"
    
    private_cidr_1 = "10.0.200.0/24"
    
    private_cidr_2 = "10.0.201.0/24"
    
}
