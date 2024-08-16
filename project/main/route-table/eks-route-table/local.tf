# 현재 지원되는 라우팅 테이블 target type
# internet gateway    : igw-
# nat gateway         : nat-
# vpc endpoind        : vpce-
# trangit gateway     : tgw-
# managed prefix list : pl-
# peering connection  : pcx-

# 기본 Route Table값인 VPC CIDR과 겹치면 안됩니다.

locals {
  route_rule = {
    # nat = {
      # cidr_block = "0.0.0.0/0",
      # target = data.aws_nat_gateway.this.id
    # },
    # s3 = { 
    #   cidr_block = "pl-78a54011", # prefix_list 사용 시
    #   target = data.aws_nat_gateway.this.id
    # }
  }
}