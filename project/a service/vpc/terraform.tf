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