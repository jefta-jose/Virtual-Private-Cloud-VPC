output "cidr_public_subnet" {
  value = var.cidr_public_subnet
}

output "public_subnet_id" {
  value = aws_subnet.jeff-254-public-subnet.id
}

output "public_subnet" {
  value = aws_subnet.jeff-254-public-subnet
}

# --------------------------------------------------->

output "cidr_private_subnet" {
  value = var.cidr_private_subnet
}

output "private_subnet_id" {
  value = aws_subnet.jeff-254-private-subnet.id
}

output "private_subnet" {
  value = aws_subnet.jeff-254-private-subnet
}