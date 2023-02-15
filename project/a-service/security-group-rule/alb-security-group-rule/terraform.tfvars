
# 자신 보안그룹 확인용 module로 넘기지는 않음.
env = "dev"
project = "sdh"
name = "alb"

vpc_filter_name = {
  Name = "dev-sdh-a-service-vpc"
}
tags = {
  env = "demo"
}