
env = "dev"
project = "sdh"
name = "bastion"

vpc_filter_name = {
  Name = "dev-sdh-a-service-vpc"
}
# sg_filter_name_01 = {
#   Name = "dev-a-service-default-sg"
# }
# sg_filter_name_02 = {
#   Name = "dev-a-service-eks-sg"
# }
tags = {
  env = "demo"
}