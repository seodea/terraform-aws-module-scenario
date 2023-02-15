variable "env" { 
    type = string
}
variable "project" { 
    type = string
}
variable "name" { 
    type = string
}
variable "vpc_filter_name" { 
    type = map(string)
}
variable "subnet_filter_name" { 
    type = map(string)
}
variable "internet_gateway_filter_name" { 
    type = map(string)
    default = null
}
variable "nat_gateway_filter_name" { 
    type = map(string)
    default = null
}
variable "tags" { 
    type = map(string)
}