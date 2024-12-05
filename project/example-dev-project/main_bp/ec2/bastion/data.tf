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

data "aws_subnets" "this" {
  filter {
    name   = "vpc-id"
    values = [data.aws_vpc.this.id]
  }

  dynamic "filter" {
    for_each = var.subnet_filter_name
    iterator = subnet
    content {
        name   = "tag:${subnet.key}"
        values = [subnet.value] # insert values here
    }
  }
}

data "aws_security_groups" "this" {
  filter {
    name   = "vpc-id"
    values = [data.aws_vpc.this.id]
  }

  dynamic "filter" {
    for_each = var.sg_filter_name
    iterator = sg
    content {
      name   = "tag:${sg.key}"
      values = sg.value
    }
  }
}

# data "aws_ami" "amazon_linux" {
#   most_recent = true
#   owners      = ["amazon"]

#   filter {
#     name   = "name"
#     values = ["amzn-ami-hvm-*-x86_64-gp2"]
#   }
# }