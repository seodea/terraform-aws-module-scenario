variable "method" { 
    type = string
}
variable "env" { 
    type = string
}
variable "company" { 
    type = string
}
variable "name" { 
    type = string
}
variable "vpc_filter_name" { 
    type = map(string)
}
variable "tags" { 
    type = map(string)
}