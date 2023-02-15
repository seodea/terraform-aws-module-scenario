
env = "dev"
project = "sdh"
name = "alb"

# {env}-{project}-{name}-vpc
vpc_filter_name = {
  Name = "dev-sdh-a-service-vpc" 
}

# {env}-igw
subnet_filter_name = {
  # Name = "sdh-eks-2a-subnet" # 단일
  Name = "sdh-alb-*" # 같은 용도의 sunbet 여러개 선택 시  
}

# {env}-igw
internet_gateway_filter_name = {
  Name = "a-service-igw"
}

# {env}-{zone}-nat
# nat_gateway_filter_name = {
#   Name = "sdh-2a-nat"
# }

tags = {
  env = "demo"
}