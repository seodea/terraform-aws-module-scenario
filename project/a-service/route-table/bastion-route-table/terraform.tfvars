
env = "dev"
name = "bastion"

vpc_filter_name = {
  Name = "dev-a-service-vpc"
}
subnet_filter_name = {
  # Name = "sdh-eks-2a-subnet" # 단일
  Name = "sdh-bastion-*" # 같은 용도의 sunbet 여러개 선택 시  
}
internet_gateway_filter_name = {
  Name = "sdh-igw"
}

# nat_gateway_filter_name = {
#   Name = "sdh-2a-nat"
# }

tags = {
  env = "demo"
}