module security_group {
    source = "../../../../module/terraform-aws-security-group-rule"

    vpc_id  = data.aws_vpc.this.id   
    main_sg_name = data.aws_security_groups.this.ids
    
    sg_rule = local.sg_rule

    tags    = var.tags
}