module security_group {
    source = "../../../../module/terraform-aws-security-group"

    env = var.env
    project = var.project
    name = var.name

    vpc_id  = data.aws_vpc.this.id   
    # sg_rule = local.sg_rule

    tags    = var.tags
}