# # 현재 지원되는 라우팅 테이블 target type
# # internet gateway    : igw-
# # nat gateway         : nat-
# # vpc endpoind        : vpce-
# # trangit gateway     : tgw-
# # managed prefix list : pl-
# # peering connection  : pcx-

# # 변수 값에서 cidr, self, security group 겹치면 안됩니다.
# # All = -1, IPV4-ICMP = 1, TCP = 6, UDP = 17, IPV6-ICMP = 58
# # name 규칙 = {ingress/egress}_{cidr/self/sg}_{용도}_{port}_{protocol}

# locals {
#   sg_rule = {
#     ingress_cidr_worknode_all_tcp = {
#       type = "ingress"
#       protocol = "6" #tcp or 6
#       to_port = "0"
#       from_port = "0"
#       cidr_block = ["1.1.1.0/24", "2.2.2.0/24"]
#       prefix_list_ids = []
#       self = false
#       source_security_group_id = ""
#       description = ""
#     },
#     ingress_prefix_worknode_to_s3_443_tcp = {
#       type = "ingress"
#       protocol = "tcp"
#       to_port = "443"
#       from_port = "443"
#       cidr_block = []
#       prefix_list_ids = ["pl-78a54011"]
#       self = false
#       source_security_group_id = ""
#       description = ""
#     },
#     ingress_self_worknode_all = { 
#       type = "ingress"
#       protocol = "-1"
#       to_port = "0"
#       from_port = "65535"
#       cidr_block = []
#       prefix_list_ids = []
#       self = true
#       source_security_group_id = ""
#       description = ""
#     },
#     ingress_sg_alb_80_tcp = {
#       type = "ingress"
#       protocol = "tcp"
#       to_port = "80"
#       from_port = "80"
#       cidr_block = []
#       prefix_list_ids = []
#       self = []
#       source_security_group_id = join("", data.aws_security_groups.security_group_01.ids)
#       description = ""
#     },
#     ingress_sg_control_plan_10250_tcp = {
#       type = "ingress"
#       protocol = "tcp"
#       to_port = "10250"
#       from_port = "10250"
#       cidr_block = []
#       prefix_list_ids = []
#       self = []
#       source_security_group_id = join("", data.aws_security_groups.security_group_02.ids)
#       description = ""
#     },
#     engress_sg_control_plan_10250_tcp = {
#       type = "engress"
#       protocol = "tcp"
#       to_port = "10250"
#       from_port = "10250"
#       cidr_block = []
#       prefix_list_ids = []
#       self = []
#       source_security_group_id = join("", data.aws_security_groups.security_group_01.ids)
#       description = ""
#     },
#     engress_sg_control_plan_443_tcp = {
#       type = "engress"
#       protocol = "tcp"
#       to_port = "443"
#       from_port = "443"
#       cidr_block = []
#       prefix_list_ids = []
#       self = []
#       source_security_group_id = join("", data.aws_security_groups.security_group_02.ids)
#       description = ""
#     },

#   }
# }