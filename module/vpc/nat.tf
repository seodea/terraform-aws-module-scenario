# NAT

resource "aws_eip" "eip_for_nat_a" {
  vpc      = true
  
  tags = {
    Name = format(
      "%s-%s-nat-a-eip",
      var.company,
      var.environment
    )
  }
}

resource "aws_nat_gateway" "vpc_a_nat" {
  depends_on = [aws_internet_gateway.igw_a]
  
  allocation_id = aws_eip.eip_for_nat_a.id
  subnet_id     = aws_subnet.vpc_a_public[0].id

  tags = {
    Name = format(
      "%s-%s-nat-a",
      var.company,
      var.environment
    )
  }

}
