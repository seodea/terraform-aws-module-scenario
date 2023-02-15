


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
    values = [format("%s-%s-sg", var.env, var.project, var.name)]
  }
}

data "aws_security_groups" "control_plane" {
  filter {
    name   = "vpc-id"
    values = [data.aws_vpc.this.id]
  }

  dynamic "filter" {
    for_each = var.control_plane
    iterator = sg
    content {
        name   = "tag:${sg.key}"
        values = [sg.value] # insert values here
    }
  }
}

data "aws_security_groups" "alb_sg" {
  filter {
    name   = "vpc-id"
    values = [data.aws_vpc.this.id]
  }

  dynamic "filter" {
    for_each = var.alb_sg
    iterator = sg
    content {
        name   = "tag:${sg.key}"
        values = [sg.value] # insert values here
    }
  }
}

data "aws_security_groups" "endpoint_sg" {
  filter {
    name   = "vpc-id"
    values = [data.aws_vpc.this.id]
  }

  dynamic "filter" {
    for_each = var.endpoint_sg
    iterator = sg
    content {
        name   = "tag:${sg.key}"
        values = [sg.value] # insert values here
    }
  }
}