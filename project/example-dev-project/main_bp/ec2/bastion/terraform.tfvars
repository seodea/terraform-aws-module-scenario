
company = "yuanta"
env = "prod"
method = "mts"
name = "bastion"

azs = "ap-northeast-2a"
user_data = ""

# {company}-{env}-{method}-vpc
vpc_filter_name = {
  Name = "yuanta-prod-mts-vpc"
}

# {company}-{method}-{name}-{region}-subnet
subnet_filter_name = {
  Name = "prod-mts-public-2a-subnet" # 단일 {company}-{method}-{region}-subnet
}

############################
### Security Group info ####
############################

# {company}-{method}-sg
sg_filter_name = {
  Name = ["prod-mts-bastion-sg"] # 단일 {company}-{method}-sg
}

ami = "ami-0c2acfcb2ac4d02a0"
instance_type = "t2.micro"
key_name = "sdh-bp"

associate_public_ip_address = true

tags = {
    env = "prod",
    serivce = "bastion"
  }