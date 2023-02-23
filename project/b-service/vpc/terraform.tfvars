
env = "dev"
project = "sdh"
name = "a-service"
vpc_cidr = "10.0.0.0/16"
azs = ["ap-northeast-2a", "ap-northeast-2c"]

enable_internet_gateway = true
enable_nat_gateway = true

subnet = {
  bastion = {
    method = "public",
    cidr = ["10.0.0.0/27", "10.0.0.32/27"],
    nat_gateway_subnet = "yes" # NAT gateway subnet True 시, internet gateway True 필수
  },
  
  alb = {
    method = "public",
    cidr = ["10.0.0.64/27", "10.0.0.96/27"],
    nat_gateway_subnet = "no"
  },
  
  eks = {
    method = "private",
    cidr = ["10.0.0.128/27", "10.0.0.160/27"],
    nat_gateway_subnet = "no"
  },

# rds ={

# }
}

tags = {
    "env" = "demo"
  }