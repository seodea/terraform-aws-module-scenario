################################################################################
# VPC
################################################################################

resource "aws_vpc" "this" {

  # cidr_block = var.use_ipam_pool ? null : var.cidr
  cidr_block = var.cidr
  
  tags = merge(
    { "Name" = var.name },
    var.tags,
  )
}

################################################################################
# Internet Gateway
################################################################################

# resource "aws_internet_gateway" "this" {
#   count = local.create_vpc && var.create_igw && length(var.public_subnets) > 0 ? 1 : 0

#   vpc_id = local.vpc_id

#   tags = merge(
#     { "Name" = var.name },
#     var.tags,
#     var.igw_tags,
#   )
# }

# resource "aws_egress_only_internet_gateway" "this" {
#   count = local.create_vpc && var.create_egress_only_igw && var.enable_ipv6 && local.max_subnet_length > 0 ? 1 : 0

#   vpc_id = local.vpc_id

#   tags = merge(
#     { "Name" = var.name },
#     var.tags,
#     var.igw_tags,
#   )
# }
