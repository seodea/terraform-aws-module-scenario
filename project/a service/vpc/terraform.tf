terraform {
  required_version = ">= 0.13.7"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 4.51.0"
    }
  }

#   backend "s3" {
#     bucket         = "kis-mts-test-tf-state-backend"
#     key            = "961030948515/test/bond-bill/config-rule/terraform.state"
#     region         = "ap-northeast-2"
#     dynamodb_table = "kis-mts-test-tf-state-locks" # 다이나모 테이블 이름 변경 가능(필요 시)
#     encrypt        = true
#     profile        = "default"
#   }  

}