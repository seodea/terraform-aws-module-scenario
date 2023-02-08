


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


data "aws_internet_gateway" "this" {
  dynamic "filter" {
    for_each = var.internet_gateway_filter_name
    iterator = tag
    content {
      name   = "tag:${tag.key}"
      values = [tag.value]
    }
  }
}

data "aws_nat_gateway" "this" {
 dynamic "filter" {
   for_each = var.nat_gateway_filter_name
   iterator = tag
   content {
     name   = "tag:${tag.key}"
     values = [tag.value]
   }
 }
}