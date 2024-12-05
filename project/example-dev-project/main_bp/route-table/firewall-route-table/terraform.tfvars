
company = "yuanta"
env     = "prod"
method  = "mts"
name    = "sec"

# {name}-{env}-{method}-vpc
vpc_filter_name = {
  Name = "yuanta-prod-mts-vpc"
}

# {name}-{용도}-{zone}-subnet
subnet_filter_name = {
  # Name = "yuanta-eks-2a-subnet" # 단일 {company}-{method}-{region}-subnet
  Name = "prod-mts-sec-*" # 같은 용도의 sunbet 여러개 선택 시  
}

# {name}-{zone}-nat
# nat_gateway_filter_name = {
#   Name = "yuanta-2c-nat"
# }

tags = {
  env = "prod"
}