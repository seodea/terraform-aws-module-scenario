
company = "yuanta"
env     = "prod"
method  = "mts"
name  = "gwlb"

azs     = "2c"

vpc_filter_name = {
  Name = "yuanta-prod-mts-vpc"
}

subnet_filter_name = {
  # Name = "yuanta-eks-2a-subnet" # 단일 {company}-{method}-{region}-subnet
  Name = "prod-mts-public-2c-subnet" # 같은 용도의 sunbet 여러개 선택 시  
}

# {company}-{env}-{method}-igw
internet_gateway_filter_name = {
  Name = "yuanta-prod-mts-igw"
}

# {company}-{env}-{method}-{zone}-nat
# nat_gateway_filter_name = {
#   Name = "yuanta-prod-service-2c-nat"
# }

tags = {
  env = "prod"
}