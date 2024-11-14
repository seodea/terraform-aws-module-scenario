
company = "sdh"
env = "prd"
method = "public"

vpc_filter_name = {
  Name = "sdh-prd-service-vpc"
}

subnet_filter_name = {
  # Name = "sdh-eks-2a-subnet" # 단일 {company}-{method}-{region}-subnet
  Name = "sdh-public-*" # 같은 용도의 sunbet 여러개 선택 시  
}

# {company}-{env}-{method}-igw
internet_gateway_filter_name = {
  Name = "sdh-prd-service-igw"
}

# {company}-{env}-{method}-{zone}-nat
# nat_gateway_filter_name = {
#   Name = "sdh-prd-service-2c-nat"
# }

tags = {
  env = "prd"
}