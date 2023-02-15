
env = "dev"
project = "sdh"
name = "bastion"

vpc_filter_name = {
  Name = "dev-sdh-a-service-vpc"
}
control_plane_sg = {
  Name = "dev-sdh-control-plane-sg"
}
alb_sg = {
  Name = "dev-sdh-alb-sg"
}
endpoint_sg = {
  Name = "dev-sdh-endpoint-sg"
}
tags = {
  env = "demo"
}