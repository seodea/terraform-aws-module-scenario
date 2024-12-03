################################################################################
# SG
################################################################################

resource "aws_security_group" "this" {
  name                   = format("%s-%s-%s-sg", var.env, var.method, var.name )
  vpc_id                 = var.vpc_id
  
  lifecycle {
    create_before_destroy = true
  }

  tags = merge(
    var.tags,
    { 
      "Name" = format("%s-%s-%s-sg",
        var.env,
        var.method,
        var.name
      )
    }
  )
}
