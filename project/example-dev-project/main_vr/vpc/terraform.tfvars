
company = "sdh"
env = "prd"
method = "vr"

vpc_cidr = "10.10.0.0/16"
azs = ["ap-northeast-2a", "ap-northeast-2c"]

enable_internet_gateway = false
enable_nat_gateway = false

subnet = {
  service = {
    method = "public",
    cidr = ["10.10.10.0/24", "10.10.20.0/24"],
    nat_gateway_subnet = "no" # NAT gateway subnet True 시, internet gateway True 필수
  },
  
  mgmt = {
    method = "private",
    cidr = ["10.10.11.0/24", "10.10.21.0/24"],
    nat_gateway_subnet = "no"
  },
  
  tgw-attach = {
  method = "private",
  cidr = ["10.10.12.0/27", "10.10.22.0/27"],
  nat_gateway_subnet = "no"
  }
  
}

tags = {
    "env" = "prd"
  }