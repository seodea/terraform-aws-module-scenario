

locals { 
  route_table = flatten([
    for k,v in var.route_rule : {
        name = k
        cidr_block = v.cidr_block
        target = v.target
    } 
  ])
}
