


data "aws_vpc" "this" {
  dynamic "filter" {
    for_each = var.vpc_filter_name
    iterator = vpc
    content {
        name   = "tag:${vpc.key}"
        values = [vpc.value] # insert values here
    }
  }
}
data "aws_security_groups" "this" {
  filter {
    name   = "vpc-id"
    values = [data.aws_vpc.this.id]
  }

  filter {
    name   = "tag:Name"
    values = [format("%s-%s-%s-sg", var.env, var.project, var.name)]
  }
}

# data "aws_security_groups" "security_group_01" {
#   filter {
#     name   = "vpc-id"
#     values = [data.aws_vpc.this.id]
#   }

#   dynamic "filter" {
#     for_each = var.sg_filter_name_01
#     iterator = sg
#     content {
#         name   = "tag:${sg.key}"
#         values = [sg.value] # insert values here
#     }
#   }
# }
# data "aws_security_groups" "security_group_02" {
#   filter {
#     name   = "vpc-id"
#     values = [data.aws_vpc.this.id]
#   }

#   dynamic "filter" {
#     for_each = var.sg_filter_name_02
#     iterator = sg
#     content {
#         name   = "tag:${sg.key}"
#         values = [sg.value] # insert values here
#     }
#   }
# }