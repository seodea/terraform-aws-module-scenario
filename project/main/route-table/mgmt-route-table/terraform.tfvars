
company    = "sdh"
env        = "dev"
method     = "mgmt"

# {name}-{env}-{method}-vpc
vpc_filter_name = {
  Name = "sdh-dev-fsi-scenario-vpc"
}

# {name}-{용도}-{zone}-subnet
subnet_filter_name = {
  # Name = "sdh-eks-2a-subnet" # 단일 {company}-{method}-{region}-subnet
  Name = "sdh-mgmt-*" # 같은 용도의 sunbet 여러개 선택 시  
}

# {name}-{zone}-nat
# nat_gateway_filter_name = {
#   Name = "sdh-2c-nat"
# }

tags = {
  env = "Dev"
}