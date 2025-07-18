# elastic ip
resource "aws_eip" "jeff-254-elastic-ip" {
  count = length(var.cidr_private_subnet)
  domain = vpc
}

# nat gateway
resource "aws_nat_gateway" "jeff-254-nat-gateway" {
  count = length(var.cidr_private_subnet)
  depends_on = [ aws_eip.jeff-254-elastic-ip ]
  allocation_id = aws_eip.jeff-254-elastic-ip[count.index].id
  subnet_id = var.cidr_private_subnet[count.index].id
}