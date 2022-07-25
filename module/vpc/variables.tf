# Configure
## Configures AWS version
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}

## Configures AWS provider
provider "aws" {
  region = var.region
}


# Input Variables
############################
## AWS environments
variable "company" {
  description = "Name to be used on all the resources as identifier"
  type        = string
  default     = "mz"
}
variable "environment" {
  description = "What current stage is your resource "
  type        = string
  default     = "tf-test"
}
variable "region" {
  description = "The region to deploy the cluster in, e.g: ap-northeast-2"
  type    = string
  default = "ap-northeast-2"
}
variable "zone_1" {
  description = "The region to deploy the cluster in, e.g: ap-northeast-2"
  type    = string
  default = "a"
}
variable "zone_2" {
  description = "The region to deploy the cluster in, e.g: ap-northeast-2"
  type    = string
  default = "c"
}


############################
## VPC base parameters
variable "vpc_cidr" {
  description = "The CIDR block for the VPC. Default value is a valid CIDR, but not acceptable by AWS and should be overridden"
  type        = string
  default     = "10.0.0.0/16"
}

############################
## Subnet base parameters

variable "public_cidr" {
  description = "The CIDR block for the VPC. Default value is a valid CIDR, but not acceptable by AWS and should be overridden"
  type        = string
  default     = "10.0.0.0/24"
}
variable "private_cidr_1" {
  description = "The CIDR block for the VPC. Default value is a valid CIDR, but not acceptable by AWS and should be overridden"
  type        = string
  default     = "10.0.200.0/24"
}
variable "private_cidr_2" {
  description = "The CIDR block for the VPC. Default value is a valid CIDR, but not acceptable by AWS and should be overridden"
  type        = string
  default     = "10.0.201.0/24"
}


############################
## VPC base parameters3 
variable "enable_dns_hostnames" {
  description = "Should be true to enable DNS hostnames in the VPC"
  type        = bool
  default     = true
}
variable "enable_dns_support" {
  description = "Should be true to enable DNS support in the VPC"
  type        = bool
  default     = true
}
variable "instance_tenancy" {
  description = "A tenancy option for instances launched into the VPC"
  type        = string
  default     = "default"
}
variable "assign_generated_ipv6_cidr_block" {
  description = "Define whether to use ipv6"
  type        = string
  default     = "false"
}

