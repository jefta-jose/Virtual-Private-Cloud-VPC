# public route table to public subnet
resource "aws_route_table_association" "jeff-254-public-subnet-association" {
  count = length(var.cidr_public_subnet)
  depends_on = [ var.public_subnet , var.public_route_table ]
  subnet_id = element(var.public_subnet_id[*].id, count.index)
  route_table_id = var.public_route_table_id
}

# private route table to private subnet
resource "aws_route_table_association" "jeff-254-private-subnet-association" {
  count = length(var.cidr_private_subnet)
  depends_on = [ var.private_subnet , var.private_route_table ]
  subnet_id = element(var.private_subnet_id[*].id, count.index)
  route_table_id = var.private_route_table_id
}