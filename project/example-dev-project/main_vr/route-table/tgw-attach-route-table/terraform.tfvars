
company = "sdh"
env = "prd"
method = "tgw-attach"

vpc_filter_name = {
  Name = "sdh-prd-vr-vpc"
}

subnet_filter_name = {
  # Name = "sdh-eks-2a-subnet" # 단일 {company}-{method}-{region}-subnet
  Name = "sdh-tgw-attach-*" # 같은 용도의 sunbet 여러개 선택 시  
}

tags = {
  env = "prd"
}