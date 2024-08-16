
company = "sdh"
env = "dev"
method = "fsi-scenario"

vpc_cidr = "10.0.0.0/16"
azs = ["ap-northeast-2a", "ap-northeast-2c"]

enable_internet_gateway = true
enable_nat_gateway = true

subnet = {
  bastion = {
    method = "public",
    cidr = ["10.0.10.0/24", "10.0.20.0/24"],
    nat_gateway_subnet = "yes" # NAT gateway subnet True 시, internet gateway True 필수
  },
  
  mgmt = {
    method = "private",
    cidr = ["10.0.11.0/24", "10.0.21.0/24"],
    nat_gateway_subnet = "no"
  },
   
  eks = {
    method = "private",
    cidr = ["10.0.12.0/24", "10.0.22.0/24"],
    nat_gateway_subnet = "no"
  },
  
  db = {
    method = "private",
    cidr = ["10.0.13.0/24", "10.0.23.0/24"],
    nat_gateway_subnet = "no"
  }

# rds ={

# }
}

tags = {
    "env" = "dev"
  }