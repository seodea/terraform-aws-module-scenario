provider "aws" {
  region = "ap-northeast-2"

  # AWS provider 4.x version 이후부턴 profile 설정으로 자동으로 제공
  profile = "main-sdh"
}