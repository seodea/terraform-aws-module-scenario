
################################################################################
# SG Rule - CIDR
################################################################################

resource "aws_security_group_rule" "cidr_rules" {
  security_group_id = join("", var.main_sg_name)

  for_each          = { for i in local.cidr_rule : i.name => i }
  type              = each.value.type

  cidr_blocks       = each.value.cidr_block
  prefix_list_ids   = each.value.prefix_list_ids
  description       = each.value.description

  from_port         = each.value.from_port
  to_port           = each.value.to_port
  protocol          = each.value.protocol

}

################################################################################
# SG Rule - Prefix
################################################################################

resource "aws_security_group_rule" "prefix_rules" {
  security_group_id = join("", var.main_sg_name)

  for_each          = { for i in local.prefix_rule : i.name => i }
  type              = each.value.type

  cidr_blocks       = each.value.cidr_block
  prefix_list_ids   = each.value.prefix_list_ids
  description       = each.value.description

  from_port         = each.value.from_port
  to_port           = each.value.to_port
  protocol          = each.value.protocol

}

################################################################################
# SG Rule - Self
################################################################################

resource "aws_security_group_rule" "self_rules" {
  security_group_id = join("", var.main_sg_name)

  for_each          = { for i in local.self_rule : i.name => i }
  type              = each.value.type

  self              = each.value.self
  prefix_list_ids   = each.value.prefix_list_ids
  description       = each.value.description
  
  from_port         = each.value.from_port
  to_port           = each.value.to_port
  protocol          = each.value.protocol

}

################################################################################
# SG Rule - Security Group
################################################################################

resource "aws_security_group_rule" "security_group_rules" {
  security_group_id = join("", var.main_sg_name)

  for_each                 = { for i in local.sg_rule : i.name => i }
  type                     = each.value.type

  source_security_group_id = each.value.source_security_group_id
  prefix_list_ids          = each.value.prefix_list_ids
  description              = each.value.description

  from_port                = each.value.from_port
  to_port                  = each.value.to_port
  protocol                 = each.value.protocol
}
