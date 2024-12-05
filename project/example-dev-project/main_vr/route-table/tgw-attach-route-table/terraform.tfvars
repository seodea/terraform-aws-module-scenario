
company = "yuanta"
env = "prod"
method = "network"
name = "tgw-attach"

vpc_filter_name = {
  Name = "yuanta-prod-network-vpc"
}

subnet_filter_name = {
  # Name = "yuanta-eks-2a-subnet" # 단일 {company}-{method}-{region}-subnet
  Name = "prod-network-tgw-attach-*" # 같은 용도의 sunbet 여러개 선택 시  
}

tags = {
  env = "prod"
}