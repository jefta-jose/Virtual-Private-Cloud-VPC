# public subnet
resource "aws_subnet" "jeff-254-public-subnet" {
  count = length(var.cidr_public_subnet)
  vpc_id = var.vpc_id
  cidr_block = element(var.cidr_public_subnet, count.index)
  availability_zone = element(var.eu_availability_zone, count.index)
}

# private subnet
resource "aws_subnet" "jeff-254-private-subnet" {
  count = length(var.cidr_private_subnet)
  vpc_id = var.vpc_id
  cidr_block = element(var.cidr_private_subnet, count.index)
  availability_zone = element(var.eu_availability_zone, count.index)
}