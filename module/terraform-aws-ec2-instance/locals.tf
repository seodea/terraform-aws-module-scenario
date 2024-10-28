locals {
    disk = flatten([ for k,v in var.servers : [ 
        for kk,vv in v : { 
            name        = "${k}-${kk}",
            size        = vv.size,
            device_name = vv.device_name
            type        = vv.type
            ec2         = k 
        } 
    ]])
}
