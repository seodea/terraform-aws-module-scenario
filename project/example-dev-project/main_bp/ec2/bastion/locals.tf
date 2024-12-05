locals {

    root_block_device = [] # 안할경우 기본값으로 설정
    # root_block_device = [
    #     {
    #       encrypted   = false
    #       volume_type = "gp3"
    #       throughput  = 200
    #       volume_size = 50
    #       tags = {
    #         Name = "my-root-block"
    #       }
    #     }
    # ]
}
