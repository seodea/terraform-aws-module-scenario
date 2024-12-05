company = "yuanta"
env = "prod"
method  = "mts"
name  = "bp"

vpc_filter_name = {
  Name = "yuanta-prod-mts-vpc"
}

# {env}-{method}-{name}-sg
# sg_filter_name_01 = {
#   Name = "prod-mts-bp-sg"
# }

# sg_filter_name_02 = {
#   Name = "dev-a-service-eks-sg"
# }

tags = {
  env = "prod"
}