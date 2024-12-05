company = "yuanta"
env = "prod"
method = "network"
name = "vr"

numbering = [2]

azs = "ap-northeast-2c"

#####################
### Network info ####
#####################

# {company}-{env}-{method}-vpc
vpc_filter_name = {
  Name = "yuanta-prod-network-vpc"
}

# {company}-{method}-{name}-{region}-subnet
subnet_filter_name = {
  Name = "prod-network-mgmt-2c-subnet" # 단일 {company}-{method}-{region}-subnet
}

############################
### Security Group info ####
############################

# {company}-{method}-sg
sg_filter_name = {
  Name = [ "prod-network-vr-sg"] # 단일 # {company}-{method}-{name}-sg
}

#################
### EBS info ####
#################

ami = "ami-02c329a4b4aba6a48" # amazone linux3
instance_type = "t2.micro"
key_name = "sdh-vr"

tags = {
    "env" = "prod"
  }