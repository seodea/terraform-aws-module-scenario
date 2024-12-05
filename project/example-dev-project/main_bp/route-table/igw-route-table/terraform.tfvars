
company = "yuanta"
env     = "prod"
method  = "mts"
name    = "igw"

# {name}-{env}-{method}-vpc
vpc_filter_name = {
  Name = "yuanta-prod-mts-vpc"
}

tags = {
  env = "prod"
}