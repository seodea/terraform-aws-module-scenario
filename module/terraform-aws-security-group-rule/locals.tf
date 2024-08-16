

locals {
  cidr_rule = flatten([
    for k,v in var.sg_rule : [
      for ip in v.cidr_block : {
        name = format("%s-%sbit", k, replace(ip, "/", "_"))
        type = v.type
        protocol = v.protocol
        to_port = v.to_port
        from_port = v.from_port
        cidr_block = [ip]
        prefix_list_ids = length(v.prefix_list_ids) > 0 && length(ip) > 0 ? v.prefix_list_ids : []
        description = v.description
      } 
    ]
    if length(v.cidr_block) > 0 && v.self == false
  ])
}

locals {
  prefix_rule = flatten([
    for k,v in var.sg_rule : {
      name = k
      type = v.type
      protocol = v.protocol
      to_port = v.to_port
      from_port = v.from_port
      cidr_block = []
      prefix_list_ids = v.prefix_list_ids
      description = v.description
    } 
    if length(v.prefix_list_ids) > 0 && v.self == false
  ])
}

locals {
  self_rule = flatten([
    for k,v in var.sg_rule : {
      name = k
      type = v.type
      protocol = v.protocol
      to_port = v.to_port
      from_port = v.from_port
      prefix_list_ids = v.prefix_list_ids
      self = v.self
      description = v.description
    }
    if v.self == true
  ])
}

locals {
  sg_rule = flatten([
    for k,v in local.sg_rule : {
      name = k
      type = v.type
      protocol = v.protocol
      to_port = v.to_port
      from_port = v.from_port
      prefix_list_ids = v.prefix_list_ids
      source_security_group_id = join("", v.source_security_group_id)
      description = v.description
    }
    if v.source_security_group_id != ""
  ])
}

