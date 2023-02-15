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
    ingress_cidr_internet_https_443_tcp = {
      type = "ingress"
      protocol = "6" #tcp or 6
      to_port = 443
      from_port = 443
      cidr_block = ["0.0.0.0/0"]
      prefix_list_ids = []
      self = false
      source_security_group_id = ""
      description = "all access https from internet"
    },
    ingress_cidr_internet_http_80_tcp = {
      type = "ingress"
      protocol = "6" #tcp or 6
      to_port = 80
      from_port = 80
      cidr_block = ["0.0.0.0/0"]
      prefix_list_ids = []
      self = false
      source_security_group_id = ""
      description = "all access http from internet"
    }
  }
}