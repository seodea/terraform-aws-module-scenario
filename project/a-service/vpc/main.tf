module vpc {
    source = "../../../module/terraform-aws-vpc"

    env                     = var.env
    name                    = var.name
    vpc_cidr                = var.vpc_cidr
    azs                     = var.azs
    enable_internet_gateway = var.enable_internet_gateway
    enable_nat_gateway      = var.enable_nat_gateway
    subnet                  = var.subnet

    tags                    = var.tags
}