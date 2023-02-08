variable "env" { 
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
}
variable "nat_gateway_filter_name" { 
    type = map(string)
}
variable "tags" { 
    type = map(string)
}