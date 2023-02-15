################################################################################
# SG
################################################################################

resource "aws_security_group" "this" {
  name                   = format("%s-%s-sg", var.env, var.project ,var.name )
  vpc_id                 = var.vpc_id
  
  lifecycle {
    create_before_destroy = true
  }

  tags = merge(
    var.tags,
    { 
      "Name" = format("%s-%s-sg",
        var.env,
        var.name
      )
    }
  )
}