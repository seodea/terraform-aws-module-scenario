
company   = "sdh"
method = "firewall"

vpc_filter_name = {
  Name = "sdh-prd-service-vpc"
}

sg_filter_name_01 = {
  Name = "sdh-firewall-sg"
}

# sg_filter_name_02 = {
#   Name = "dev-a-service-eks-sg"
# }

tags = {
  env = "prd"
}