variable "method" { 
    type = string
}
variable "company" { 
    type = string
}
variable "vpc_filter_name" { 
    type = map(string)
}
variable "sg_filter_name_01" { 
    type = map(string)
}
# variable "sg_filter_name_02" { 
#     type = map(string)
# }
variable "tags" { 
    type = map(string)
}