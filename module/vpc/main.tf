# VPC

resource "aws_vpc" "vpc_a" {
  cidr_block = var.vpc_cidr
  enable_dns_hostnames = var.enable_dns_hostnames
  enable_dns_support   = var.enable_dns_support
  assign_generated_ipv6_cidr_block = var.assign_generated_ipv6_cidr_block
  instance_tenancy = var.instance_tenancy
  tags = {
      Name = format(
        "%s-%s-vpc-a",
        var.company,
        var.environment
      )
  }
}

# Internet Gateway
resource "aws_internet_gateway" "igw_a" {
  vpc_id = aws_vpc.vpc_a.id
  tags = {
      Name = format(
        "%s-%s-igw-a",
        var.company,
        var.environment
      )
  }
}

# Public Route Talbe
resource "aws_route_table" "vpc_a_public" {
  depends_on = [aws_internet_gateway.igw_a] 
  vpc_id = aws_vpc.vpc_a.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw_a.id
  }
  tags = {
    Name = format(
        "%s-%s-vpc_a-rt-pub",
        var.company,
        var.environment
    )
  }
}

# Private Route Table

resource "aws_route_table" "vpc_a_private" {
  vpc_id = aws_vpc.vpc_a.id
  route {
    cidr_block = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.vpc_a_nat.id
  }
  tags = {
    Name = format(
        "%s-%s-vpc_a-rt-pri",
        var.company,
        var.environment
    )
  }
}


# Subnet VPC A
resource "aws_subnet" "vpc_a_public" {
  count = length(local.public_subnets_vpc_a)
  vpc_id            = aws_vpc.vpc_a.id
  cidr_block        = local.public_subnets_vpc_a[count.index].cidr
  availability_zone = local.public_subnets_vpc_a[count.index].zone
  tags = {
     Name = format(
         "%s-%s-%s-vpc_a-%s",
         var.company,
         var.environment,
         local.public_subnets_vpc_a[count.index].purpose,
         element(split("", local.public_subnets_vpc_a[count.index].zone), length(local.public_subnets_vpc_a[count.index].zone) - 1)
     )
   }
}

resource "aws_route_table_association" "vpc_a_public" {
  count = length(aws_subnet.vpc_a_public)
  subnet_id      = aws_subnet.vpc_a_public[count.index].id
  route_table_id = aws_route_table.vpc_a_public.id
}

resource "aws_subnet" "vpc_a_private" {
  count = length(local.private_subnets_vpc_a)
  vpc_id            = aws_vpc.vpc_a.id
  cidr_block        = local.private_subnets_vpc_a[count.index].cidr
  availability_zone = local.private_subnets_vpc_a[count.index].zone
  tags = {
     Name = format(
         "%s-%s-%s-vpc_a-%s",
         var.company,
         var.environment,
         local.private_subnets_vpc_a[count.index].purpose,
         element(split("", local.private_subnets_vpc_a[count.index].zone), length(local.private_subnets_vpc_a[count.index].zone) - 1)
     )
   }
}

resource "aws_route_table_association" "vpc_a_private" {
  count = length(aws_subnet.vpc_a_private)
  subnet_id      = aws_subnet.vpc_a_private[count.index].id
  route_table_id = aws_route_table.vpc_a_private.id
}
