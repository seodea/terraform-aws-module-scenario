variable "env" { 
    type = string
}
variable "project" { 
    type = string
}
variable "name" { 
    type = string
}
variable "vpc_id" { 
    type = string
}
variable "subnet_id" { 
    type = list(string)
}
variable "igw_id" { 
    type = string
    default = null
}
variable "nat_id" { 
    type = string
    default = null
}
variable "route_rule" { 
    type = map(any)
}
variable "tags" { 
    type = map(string)
}