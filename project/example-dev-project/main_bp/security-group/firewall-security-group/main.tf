module security_group {
    # source = "../../../../module/terraform-aws-security-group"
    source = "github.com/seodea/terraform-aws-module-scenario/module/terraform-aws-security-group"

    method = var.method
    company   = var.company
    env     = var.env
    name     = var.name
    
    vpc_id = data.aws_vpc.this.id

    tags   = var.tags
}