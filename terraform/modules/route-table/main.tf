# public route table
resource "aws_route_table" "jeff-254-public-route-table" {
  vpc_id = var.vpc_id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = var.aws_internet_gateway_id
  }
}

# private route table
resource "aws_route_table" "jeff-254-private-route-table" {
  count = length(var.cidr_private_subnet)
  vpc_id = var.vpc_id
  depends_on = [ var.aws_nat_gateway ]
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = var.aws_nat_gateway_id
  }
}