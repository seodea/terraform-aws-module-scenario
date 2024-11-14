company = "sdh"
env = "prd"
method = "firewall"

numbering = [1]

azs = "ap-northeast-2a"

#####################
### Network info ####
#####################

# {company}-{env}-{method}-vpc
vpc_filter_name = {
  Name = "sdh-prd-service-vpc"
}

# {company}-{method}-{region}-subnet
subnet_filter_name = {
  Name = "sdh-sec-2a-subnet" # 단일 {company}-{method}-{region}-subnet
}

############################
### Security Group info ####
############################

# {company}-{method}-sg
sg_filter_name = {
  Name = [ "sdh-firewall-sg"] # 단일 {company}-{method}-sg
}

#################
### EBS info ####
#################

ami = "ami-02c329a4b4aba6a48" # amazone linux3
instance_type = "c6in.xlarge"
key_name = "sdh-firewall"

tags = {
    "env" = "prd"
  }