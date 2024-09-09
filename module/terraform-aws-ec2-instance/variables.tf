variable "company" { 
    type = string
}
variable "env" { 
    type = string
}
variable "method" { 
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
variable "instance_type" {
    description = "The type of instance to start"
    type        = string
    default     = "t3.micro"
}
variable "key_name" { 
    type = string
    default = null
}
variable "user_data" { 
    type = string
    default = null
}
variable "private_ip" { 
    type = string
    default = null
}
variable "associate_public_ip_address" { 
    type = bool
    default = false
}

################################################################################
# IAM Role / Instance Profile
################################################################################

variable "create_iam_instance_profile" {
  description = "Determines whether an IAM instance profile is created or to use an existing IAM instance profile"
  type        = bool
  default     = false
}

variable "iam_role_name" {
  description = "Name to use on IAM role created"
  type        = string
  default     = null
}
variable "iam_instance_profile" {
    description = "IAM Instance Profile to launch the instance with. Specified as the name of the Instance Profile"
    type        = string
    default     = null
}


variable "monitoring" {
    description = "If true, the launched EC2 instance will have detailed monitoring enabled"
    type        = bool
    default     = null
}
variable "tags" { 
    type = map(string)
}
