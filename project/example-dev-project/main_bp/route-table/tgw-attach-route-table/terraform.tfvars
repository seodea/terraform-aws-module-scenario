
company = "yuanta"
env = "prod"
method = "mts"
name = "tgw-attach"

# {company}-{env}-{method}-vpc
vpc_filter_name = {
  Name = "yuanta-prod-mts-vpc"
}

# {env}-{vpc method}-{subnet용도}-{zone}-subnet
subnet_filter_name = {
  # Name = "yuanta-eks-2a-subnet" #
  Name = "prod-mts-tgw-attach-*" # 같은 용도의 sunbet 여러개 선택 시  
}

tags = {
  env = "prod"
}