
company   = "sdh"
method = "eks"

vpc_filter_name = {
  Name = "sdh-dev-fsi-scenario-vpc"
}

sg_filter_name_01 = {
  Name = "sdh-bastion-sg"
}

# sg_filter_name_02 = {
#   Name = "dev-a-service-eks-sg"
# }

tags = {
  env = "Dev"
}