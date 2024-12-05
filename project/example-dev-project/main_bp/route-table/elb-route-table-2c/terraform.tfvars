
company = "yuanta"
env = "prod"
method = "mts"
name = "elb"
azs     = "2c"

# {company}-{env}-{method}-vpc
vpc_filter_name = {
  Name = "yuanta-prod-mts-vpc"
}

# {env}-{subnet용도}-{zone}-subnet
subnet_filter_name = {
  # Name = "yuanta-eks-2a-subnet" # 단일 {company}-{method}-{region}-subnet
  Name = "prod-mts-elb-2c-subnet" # 같은 용도의 sunbet 여러개 선택 시  
}


tags = {
  env = "prod"
}