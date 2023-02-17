terraform {
  required_version = ">= 1.3.7"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 4.51.0"
    }
  }

  backend "s3" {
    bucket         = "sdh-dev-tf-state-backend"
    key            = "932824558442/dev/security-group/control-plane-security-group"
    region         = "ap-northeast-2"
    # dynamodb setting
    # dynamodb_table = "table name" # dynamodb 테이블 이름 변경 가능(필요 시)
    # encrypt        = true
    # profile        = "default"
  }  

}
