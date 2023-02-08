# 해당 Terraform Module 사용 방법

## 1. main.tf

```
module vpc {
    source = "../../../module/terraform-aws-vpc"

    env                     = var.env
    name                    = var.name
    vpc_cidr                = var.vpc_cidr
    azs                     = var.azs
    enable_internet_gateway = var.enable_internet_gateway
    enable_nat_gateway      = var.enable_nat_gateway
    subnet                  = var.subnet

    tags                    = var.tags
}
```

## 2.provider.tf

```
provider "aws" {
  region = "ap-northeast-2"

  # AWS provider 4.x version 이후부턴 profile 설정으로 자동으로 제공
  # aws-valut 사용으로 미 설정 (예시 : aws-vault exec sdh-admin -- terraform xxx) 
  # profile = "sdh-admin"
}
```

## 3.terraform.tf

```
terraform {
  required_version = ">= 0.13.7"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 4.51.0"
    }
  }

#   backend "s3" {
#     bucket         = "bucket name"
#     key            = "path"
#     region         = "ap-northeast-2"
#     dynamodb_table = "table name" # 다이나모 테이블 이름 변경 가능(필요 시)
#     encrypt        = true
#     profile        = "default"
#   }  

}

```

## 4.variables.tf
```

variable "env" { 
    type = string
}
variable "name" { 
    type = string
}

variable "vpc_cidr" { 
    type = string
}
variable "azs" { 
    type = list(string)
}
variable "enable_internet_gateway" { 
    type = bool
}
variable "enable_nat_gateway" { 
    type = bool
}
variable "subnet" { 
    type = any
}

variable "tags" { 
    type = map(string)
}
```

## 5.terraform.tfvars

```

env = "dev"
name = "a-service"
vpc_cidr = "10.0.0.0/16"
azs = ["ap-northeast-2a", "ap-northeast-2c"]

enable_internet_gateway = true
enable_nat_gateway = true

subnet = {
  bastion = {
    method = "public",
    cidr = ["10.0.0.0/27", "10.0.0.32/27"],
    nat_gateway_subnet = "yes" # NAT gateway subnet True 시, internet gateway True 필수
  },
  
  alb = {
    method = "public",
    cidr = ["10.0.0.64/27", "10.0.0.96/27"],
    nat_gateway_subnet = "no"
  },
  
  eks = {
    method = "private",
    cidr = ["10.0.0.128/27", "10.0.0.160/27"],
    nat_gateway_subnet = "no"
  },

# rds ={

# }
}

tags = {
    "env" = "demo"
  }
```