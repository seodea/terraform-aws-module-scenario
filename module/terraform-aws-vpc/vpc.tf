################################################################################
# VPC (naming : {company}-{env}-{mtehod}-vpc)
# example : mzc-prod-mts-vpc
################################################################################

resource "aws_vpc" "this" {

  cidr_block = var.vpc_cidr
  
  tags = merge(
    var.tags,
    { 
      "Name" = format("%s-%s-%s-vpc",
        var.company,
        var.env,
        var.method
      )
    }
  )
}

################################################################################
# subnet (naming : {env}-{method}-{subnet용도}-{zone}-subnet)
# example : prod-public-2a-subnet
################################################################################

resource "aws_subnet" "this" {
  vpc_id  = aws_vpc.this.id
  for_each = { for i in local.all_subnet : i.cidr => i }
  availability_zone  = var.azs[index(var.subnet[each.value.name].cidr, each.key)]

  cidr_block = each.value.cidr

  #prod-mts-bp-2a/2c-subnet 
  # env : prod
  # method : mts
  # name : public

  tags = merge(
    var.tags,
    {
      "Name" = format("%s-%s-%s-%s-subnet",
        var.env,
        var.method,
        each.value.name,
        split("-", var.azs[index(var.subnet[each.value.name].cidr, each.key)])[2]
      )
    }
  )
}

################################################################################
# Internet Gateway
################################################################################

resource "aws_internet_gateway" "this" {
  count = var.enable_internet_gateway == true ? 1 : 0
  vpc_id = aws_vpc.this.id

  tags = merge(
    var.tags,
    { 
      "Name" = format("%s-%s-%s-igw", 
        var.company,
        var.env,
        var.method
      )
    }
  )
}

################################################################################
# NAT Gateway
################################################################################

resource "aws_eip" "this" {
  domain = "vpc"
  for_each = { for i in local.natgw_subnet : i.cidr => i }

  tags = merge(
    {
      "Name" = format("%s-%s-%s-nat-eip", 
        var.env,
        var.method,
        split("-", var.azs[index(var.subnet[each.value.name].cidr, each.key)])[2]
      )      
    },
    var.tags
  )
}

resource "aws_nat_gateway" "this" {
  for_each = { for i in local.natgw_subnet : i.cidr => i }

  allocation_id = aws_eip.this[each.key].id
  subnet_id = aws_subnet.this[each.key].id

  tags = merge(
    {
      "Name" = format("%s-%s-%s-nat",
        var.env,
        var.method,
        split("-", var.azs[index(var.subnet[each.value.name].cidr, each.key)])[2]
      )
    },
    var.tags
  )

  depends_on = [aws_internet_gateway.this]
}
