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
variable "data_plane_sg" { 
    type = map(string)
}
variable "endpoint_sg" { 
    type = map(string)
}
variable "tags" { 
    type = map(string)
}