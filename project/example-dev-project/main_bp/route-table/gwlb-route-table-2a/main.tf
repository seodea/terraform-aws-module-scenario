module route {
    # source = "../../../../module/terraform-aws-route"
    source = "github.com/seodea/terraform-aws-module-scenario/module/terraform-aws-route"

    env     = var.env
    method  = var.method
    company = var.company
    name    = var.name
    azs     = var.azs

    vpc_id     = data.aws_vpc.this.id
    subnet_id  = data.aws_subnets.this.ids
    igw_id     = data.aws_internet_gateway.this.id
    route_rule = local.route_rule

    tags       = var.tags
}