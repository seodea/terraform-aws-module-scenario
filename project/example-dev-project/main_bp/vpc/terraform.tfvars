
company = "yuanta"
env = "prod"
method = "mts"

vpc_cidr = "10.0.0.0/16"
azs = ["ap-northeast-2a", "ap-northeast-2c"]

enable_internet_gateway = true
enable_nat_gateway = false

subnet = {
  public = {
    method = "public",
    cidr = ["10.0.10.0/24", "10.0.20.0/24"],
    nat_gateway_subnet = "no" # NAT gateway subnet True 시, internet gateway True 필수
  },
  
  nat = {
    method = "private",
    cidr = ["10.0.11.0/24", "10.0.21.0/24"],
    nat_gateway_subnet = "no"
  },
   
  sec = {
    method = "private",
    cidr = ["10.0.12.0/24", "10.0.22.0/24"],
    nat_gateway_subnet = "no"
  },

  elb = {
    method = "private",
    cidr = ["10.0.13.0/24", "10.0.23.0/24"],
    nat_gateway_subnet = "no"
  },
  
  bp = {
    method = "private",
    cidr = ["10.0.14.0/24", "10.0.24.0/24"],
    nat_gateway_subnet = "no"
  }

  tgw-attach = {
    method = "private",
    cidr = ["10.0.15.0/27", "10.0.25.0/27"],
    nat_gateway_subnet = "no"
  }

}

tags = {
    "env" = "prod"
  }