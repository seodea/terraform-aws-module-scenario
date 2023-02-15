
env = "dev"
project = "sdh"
name = "bastion"

vpc_filter_name = {
  Name = "dev-sdh-a-service-vpc"
}
data_plane_sg = {
  Name = "dev-data-plane-sg"
}
endpoint_sg = {
  Name = "dev-endpoint-sg"
}
tags = {
  env = "demo"
}