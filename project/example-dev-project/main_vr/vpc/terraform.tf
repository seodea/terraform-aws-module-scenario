terraform {
  required_version = ">= 1.3.7"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 4.51.0"
    }
  }

  backend "s3" {
    bucket         = "sdh-fsi-scenario-tf-state-backend"
    key            = "043309359357/sdh-fis-vr/prod/vpc"
    region         = "ap-northeast-2"
    # dynamodb setting
    # dynamodb_table = "table name" # dynamodb 테이블 이름 변경 가능(필요 시)
    # encrypt        = true
    # profile        = "default" # 사용을 원하는 경우 profile을 변경하여 진행
  }  

}
