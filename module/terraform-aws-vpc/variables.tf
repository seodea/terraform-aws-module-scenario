
variable "name" { 
    type = string
}

variable "cidr" { 
    type = string
}

variable "tags" { 
    type = map(string)
    default = {
        "env" = "demo"
    }
}



