module security_group {
    source = "../../../../module/terraform-aws-security-group"

    env = var.env
    name = var.name

    vpc_id  = data.aws_vpc.this.id

    tags    = var.tags
}