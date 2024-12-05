company = "yuanta"
env = "prod"
method = "mts"
name = "firewall"

numbering = [1]

azs = "ap-northeast-2a"

#####################
### Network info ####
#####################

# {company}-{env}-{method}-vpc
vpc_filter_name = {
  Name = "yuanta-prod-mts-vpc"
}

# {company}-{method}-{name}-{region}-subnet
subnet_filter_name = {
  Name = "prod-mts-sec-2a-subnet" # 단일 {company}-{method}-{region}-subnet
}

############################
### Security Group info ####
############################

# {company}-{method}-{name}-sg
sg_filter_name = {
  Name = [ "prod-mts-firewall-sg"] # 단일 {company}-{method}-{name}-sg
}

#################
### EBS info ####
#################

ami = "ami-02c329a4b4aba6a48" # amazone linux3
instance_type = "c6in.xlarge"
key_name = "sdh-firewall"

tags = {
    "env" = "prod"
  }