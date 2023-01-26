module vpc {
    source = "../../../module/terraform-aws-vpc"

    name = var.name
    cidr = var.cidr
}