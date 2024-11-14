
company   = "sdh"
method = "vr"

vpc_filter_name = {
  Name = "sdh-prd-vr-vpc"
}

sg_filter_name_01 = {
  Name = "sdh-vr-sg"
}

# sg_filter_name_02 = {
#   Name = "dev-a-service-eks-sg"
# }

tags = {
  env = "prd"
}