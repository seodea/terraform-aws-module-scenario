provider "aws" {
  region = "ap-northeast-2"
  # AWS provider 4.x version 이후부턴 profile 설정으로 자동으로 제공
  # aws-valut 사용으로 미 설정 (예시 : aws-vault exec sdh-admin -- terraform xxx) 
  # profile = "personal-sdh"

  assume_role {
    role_arn    = "arn:aws:iam::043309359357:role/sdh-assumerole"
  }

}