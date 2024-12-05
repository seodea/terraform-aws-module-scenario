company = "yuanta"
env = "prod"
method = "mts"
name = "bp"

numbering = [1,2]

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
  Name = "prod-mts-bp-2a-subnet" # 단일 {company}-{method}-{region}-subnet
}

############################
### Security Group info ####
############################

# {company}-{method}-{name}-sg
sg_filter_name = {
  Name = [ "prod-mts-bp-sg"] # 단일 {company}-{method}-{name}-sg
}

ami = "ami-06d4c59116568b030" # RHEL_HA-8.6.0_HVM-20240521-x86_64-58-Hourly2-GP3
instance_type = "c6i.2xlarge"
key_name = "sdh-bp"

tags = {
    "env" = "prod"
  }