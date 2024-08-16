
company = "sdh"
env = "dev"
method = "bastion"

# {company}-{env}-{method}-vpc
vpc_filter_name = {
  Name = "sdh-dev-fsi-scenario-vpc"
}

# {company}-{subnet용도}-{zone}-subnet
subnet_filter_name = {
  # Name = "sdh-eks-2a-subnet" # 단일 {company}-{method}-{region}-subnet
  Name = "sdh-bastion-*" # 같은 용도의 sunbet 여러개 선택 시  
}

internet_gateway_filter_name = {
  Name = "sdh-igw"
}

tags = {
  env = "dev"
}