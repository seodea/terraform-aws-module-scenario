# 현재 지원되는 라우팅 테이블 target type
# internet gateway    : igw-
# nat gateway         : nat-
# vpc endpoind        : vpce-
# trangit gateway     : tgw-
# managed prefix list : pl-
# peering connection  : pcx-

# 변수 값에서 cidr, self, security group 겹치면 안됩니다.
# All = -1, IPV4-ICMP = 1, TCP = 6, UDP = 17, IPV6-ICMP = 58
# name 규칙 = {ingress/egress}_{cidr/self/sg}_{용도}_{port}_{protocol}

locals {
  sg_rule = {
    ingress_sg_data_plane_https_443_tcp = {
      type = "ingress"
      protocol = "tcp" #tcp or 6
      to_port = 443
      from_port = 443
      cidr_block = []
      prefix_list_ids = []
      self = false
      source_security_group_id = join("", data.aws_security_groups.data_plane.ids)
      description = "Access API from data plane"
    },
    ingress_sg_data_plane_kubelet_10250_tcp = {
      type = "ingress"
      protocol = "tcp" #tcp or 6
      to_port = 10250
      from_port = 10250
      cidr_block = []
      prefix_list_ids = []
      self = false
      source_security_group_id = join("", data.aws_security_groups.data_plane.ids)
      description = "Access kubelet from data plane"
    },
    ingress_self_worknode_all = { 
      type = "ingress"
      protocol = "-1"
      to_port = 0
      from_port = 65535
      cidr_block = []
      prefix_list_ids = []
      self = true
      source_security_group_id = ""
      description = "Allow All protocol for DNS and Service in control plane"
    },
    egress_sg_data_plane_https_443_tcp = {
      type = "egress"
      protocol = "tcp" #tcp or 6
      to_port = 443
      from_port = 443
      cidr_block = []
      prefix_list_ids = []
      self = false
      source_security_group_id = join("", data.aws_security_groups.data_plane.ids)
      description = "Access API to data plane"
    },
    egress_sg_data_plane_kubelet_10250_tcp = {
      type = "egress"
      protocol = "tcp" #tcp or 6
      to_port = 10250
      from_port = 10250
      cidr_block = []
      prefix_list_ids = []
      self = false
      source_security_group_id = join("", data.aws_security_groups.data_plane.ids)
      description = "Access kubelet to data plane"
    },
    egress_sg_control_plane_alb_controller_tcp = {
      type = "egress"
      protocol = "tcp"
      to_port = 9443
      from_port = 9443
      cidr_block = []
      prefix_list_ids = []
      self = false
      source_security_group_id = join("", data.aws_security_groups.data_plane.ids)
      description = "Access ALB controller port from data plane"
    },
    egress_sg_endpoint_https_443_tcp = {
      type = "egress"
      protocol = "tcp"
      to_port = 443
      from_port = 443
      cidr_block = []
      prefix_list_ids = []
      self = false
      source_security_group_id = join("", data.aws_security_groups.endpoint_sg.ids)
      description = "Allow egress https to endpoint SG"
    },
  }
}