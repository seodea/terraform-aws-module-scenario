# 해당 Terraform Module 사용 방법

## 1. main.tf
main.tf은 수정이 필요없게 구성을 하여 사용자는 따로 수정이 필요하지 않습니다.
VPC naming 규칙 : `{env}-{project}-{name}-vpc`
```
module vpc {
    # source = "../../../module/terraform-aws-vpc"
    source = "github.com/seodea/terraform-aws-module-scenario/module/terraform-aws-vpc"

    company                 = var.company
    env                     = var.env
    method                  = var.method
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
  # profile = "personal-sdh"

  assume_role {
    role_arn    = "arn:aws:iam::{AccountID}:role/{Role name}"
  }

}
```

## 3.terraform.tf

```
terraform {
  required_version = ">= 1.3.7"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 4.51.0"
    }
  }

  backend "s3" {
    bucket         = "S3 Name"
    key            = "{Account ID}/dev/vpc"
    region         = "ap-northeast-2"
    # dynamodb setting
    # dynamodb_table = "table name" # dynamodb 테이블 이름 변경 가능(필요 시)
    # encrypt        = true
    # profile        = "default" # 사용을 원하는 경우 profile을 변경하여 진행
  }  

}

```

## 4.variables.tf
```


variable "company" { 
    type = string
}
variable "env" { 
    type = string
}
variable "method" { 
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

company = "sdh"
env = "dev"
method = "fsi-scenario"

vpc_cidr = "10.0.0.0/16"
azs = ["ap-northeast-2a", "ap-northeast-2c"]

enable_internet_gateway = true
enable_nat_gateway = true

subnet = {
  bastion = {
    method = "public",
    cidr = ["10.0.10.0/24", "10.0.20.0/24"],
    nat_gateway_subnet = "yes" # NAT gateway subnet True 시, internet gateway True 필수
  },
  
  mgmt = {
    method = "private",
    cidr = ["10.0.11.0/24", "10.0.21.0/24"],
    nat_gateway_subnet = "no"
  },
  
  eks = {
    method = "private",
    cidr = ["10.0.12.0/24", "10.0.22.0/24"],
    nat_gateway_subnet = "no"
  },
  
  db = {
    method = "private",
    cidr = ["10.0.13.0/24", "10.0.23.0/24"],
    nat_gateway_subnet = "no"
  }

# rds ={

# }
}

tags = {
    "env" = "dev"
  }
```