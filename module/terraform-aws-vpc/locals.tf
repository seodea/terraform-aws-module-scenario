

locals {
  all_subnet = flatten([
    for k,v in var.subnet : [
      for value in v.cidr : {
        name = k
        cidr = value
      } 
    ]
  ])
}

locals {
  natgw_subnet = flatten([
    for k,v in var.subnet : [
      for value in v.cidr : {
        name = k
        cidr = value
      } 
    ]
    if v.method == "public" && v.nat_gateway_subnet == "yes"
  ])
}