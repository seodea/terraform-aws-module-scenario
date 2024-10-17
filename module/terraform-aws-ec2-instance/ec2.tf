############################
# EC2 instance
############################

resource "aws_instance" "this" {

  ami                         = var.ami
  instance_type               = var.instance_type

  user_data                   = var.user_data

  availability_zone           = var.azs #  
  subnet_id                   = join("",var.subnet) # string : var.subnet 
  vpc_security_group_ids      = var.security_group # list 형식

  key_name                    = var.key_name # string
  monitoring                  = var.monitoring # 설정을 안할 경우 null
  
  iam_instance_profile        = var.instance_profile

  associate_public_ip_address = var.associate_public_ip_address # dafault 값은 IP 할당 X
  private_ip                  = var.private_ip # 설정을 안할 경우 null

  # root disk만 여기서 진행, 추가 Disk는 disk attachment로 진행
  dynamic "root_block_device" {
    for_each = var.root_block_device

    content {
      delete_on_termination = try(root_block_device.value.delete_on_termination, null)
      encrypted             = try(root_block_device.value.encrypted, null)
      iops                  = try(root_block_device.value.iops, null)
      kms_key_id            = lookup(root_block_device.value, "kms_key_id", null)
      volume_size           = try(root_block_device.value.volume_size, null)
      volume_type           = try(root_block_device.value.volume_type, null)
      throughput            = try(root_block_device.value.throughput, null)
      tags                  = try(root_block_device.value.tags, null)
    }
  }

  tags = merge(
    var.tags, 
    { "Name" = format("%s-%s-%s-ec2",
        var.company,
        var.env,
        var.method
      )
    }
  )
  # volume_tags = var.enable_volume_tags ? merge({ "Name" = var.name }, var.volume_tags) : null
}