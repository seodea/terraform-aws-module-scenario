
company = "sdh"
env = "dev"
method = "eks"

vpc_filter_name = {
  Name = "sdh-dev-fsi-scenario-vpc"
}

subnet_filter_name = {
  # Name = "sdh-eks-2a-subnet" # 단일 {company}-{method}-{region}-subnet
  Name = "sdh-eks-*" # 같은 용도의 sunbet 여러개 선택 시  
}

# nat_gateway_filter_name = {
#   Name = "sdh-2c-nat"
# }

tags = {
  env = "Dev"
}