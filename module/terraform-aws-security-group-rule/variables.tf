# variable "env" { 
#     type = string
# }
# variable "name" { 
#     type = string
# }
variable "vpc_id" { 
    type = string
}
variable "main_sg_name" { 
    type = list(string)
}
variable "sg_rule" { 
    type = any
}
variable "tags" { 
    type = map(string)
}