variable "numbering" { 
    type = list(string)
    default = []
}
variable "company" { 
    type = string
}
variable "env" { 
    type = string
}
variable "method" { 
    type = string
}
variable "name" { 
    type = string
}
variable "azs" { 
    type = string
}
variable "ami" { 
    type = string
}
variable "vpc_filter_name" { 
    type = map(string)
}
variable "subnet_filter_name" { 
    type = map(string)
}
variable "sg_filter_name" { 
    type = map(any)
}
variable "instance_type" {
    type = string
}
variable "key_name" { 
    type = string
    default = null
}
variable "private_ip" { 
    type = string
    default = null
}

################################################################################
# IAM Role / Instance Profile
################################################################################

variable "create_iam_instance_profile" {
    type        = bool
    default     = false
}

variable "iam_role_name" {
    type        = string
    default     = null
}
variable "iam_instance_profile" {
    type        = string
    default     = null
}
variable "monitoring" {
    type        = bool
    default     = null
}
variable "tags" { 
    type = map(string)
}
