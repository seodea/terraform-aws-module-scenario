module vpc {
    # source = "../../../module/terraform-aws-vpc"
    source = "github.com/seodea/terraform-aws-module-scenario/module/terraform-aws-vpc"

    company                 = var.company
    env                     = var.env
    method                  = var.method
    vpc_cidr                = var.vpc_cidr
    azs                     = var.azs
    enable_internet_gateway = var.enable_internet_gateway
    enable_nat_gateway      = var.enable_nat_gateway
    subnet                  = var.subnet

    tags                    = var.tags
}