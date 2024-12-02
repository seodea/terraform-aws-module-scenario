################################################################################
# route : {company}-{env}-{method}-rt
################################################################################

resource "aws_route_table" "this" {

  vpc_id = var.vpc_id

  tags = merge(
    { "Name" = var.azs != "" 
      format("%s-%s-%s-%s-rt", var.company, var.env, var.method, var.azs) :
      format("%s-%s-%s-%s-rt", var.company, var.env, var.method)
    },
    var.tags
  )
}

resource "aws_route" "this" {
  # for_each = { for route in var.route_rule : route.cidr_block => route } #change var.route_rule -> local.route_rule
  for_each = { for route in local.route_table : route.name => route } #change var.route_rule -> local.route_rule

  route_table_id         = aws_route_table.this.id
  # destination_cidr_block     = can(regex("^[0-255]", each.key)) == true ? each.key : null
  # destination_prefix_list_id = can(regex("^pl-", each.key)) == true ? each.key : null
  
  destination_cidr_block     = can(regex("^[0-255]", each.value.cidr_block)) == true ? each.value.cidr_block : null
  destination_prefix_list_id = can(regex("^pl-", each.value.cidr_block)) == true ? each.value.cidr_block : null

  gateway_id                 = startswith(each.value.target, "igw-") == true ? each.value.target : null
  nat_gateway_id             = startswith(each.value.target, "nat-") == true ? each.value.target : null
  transit_gateway_id         = startswith(each.value.target, "tgw-") == true ? each.value.target : null
  vpc_endpoint_id            = startswith(each.value.target, "vpce-") == true ? each.value.target : null
  vpc_peering_connection_id  = startswith(each.value.target, "pcx-") == true ? each.value.target : null

}
  

resource "aws_route_table_association" "this" {
  for_each = toset(var.subnet_id)
  subnet_id      = each.key
  route_table_id = aws_route_table.this.id

    depends_on = [
      aws_route_table.this
  ]

}
