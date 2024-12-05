locals {
    servers = { for v in var.numbering : 
        format("%s-%s-%s-%s", var.env, var.method, var.name, v)=>local.data_block_device
    }
    
    user_data = ""

    root_block_device = [ # 안할경우 기본값으로 설정
        # {
        #   delete_on_termination   = true
        #   encrypted   = false
        #   volume_type = "gp3"
        #   throughput  = 200
        #   volume_size = 50
        #   tags = {
        #     Name = "my-root-block"
        #   }
        # }
    ]
    
    
    data_block_device = {
        # sap = {
        #     size = 1,
        #     device_name = "/dev/sdb" # 가능 /dev/sd[b-z] or 가능 /dev/xvd[b-z] or 단, NVMe의 경우 /dev/nvme[0-26]n1 를 사용을 하지만 자동으로 연결 및 이름이 할당
        #     type = "gp3"
        # },
        # data = { 
        #     size = 2,
        #     device_name = "/dev/sdc", # 가능 /dev/sd[b-z] or 가능 /dev/xvd[b-z] or 단, NVMe의 경우 /dev/nvme[0-26]n1 를 사용을 하지만 자동으로 연결 및 이름이 할당
        #     type = "standard"
        # }
        # sap = { 
        #     size = 1
        #     device_name = "/dev/xvdd" # 가능 /dev/sd[b-z] or 가능 /dev/xvd[b-z] or 단, NVMe의 경우 /dev/nvme[0-26]n1 를 사용을 하지만 자동으로 연결 및 이름이 할당
        #     type = "gp2"
        #     skip_destroy = true
        # }
    }
}
