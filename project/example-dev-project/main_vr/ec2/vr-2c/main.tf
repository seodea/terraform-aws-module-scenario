module ec2 {
    # source = "../../../module/terraform-aws-vpc"
    source = "github.com/seodea/terraform-aws-module-scenario/module/terraform-aws-ec2-instance"

    servers                     = local.servers

    company                     = var.company
    env                         = var.env
    method                      = var.method

    azs                         = var.azs
    ami                         = var.ami
    instance_type               = var.instance_type
    subnet                      = data.aws_subnets.this.ids
    security_group              = data.aws_security_groups.this.ids

    key_name                    = var.key_name
    monitoring                  = var.monitoring

    user_data                   = var.user_data
        
    iam_instance_profile        = var.iam_instance_profile # data로 변경도 고려

    private_ip                  = var.private_ip # 설정을 안할 경우 null

    root_block_device           = local.root_block_device

    tags                        = var.tags
}