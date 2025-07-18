variable "vpc_id" {  
    type = string
}

variable "cidr_public_subnet" {
  type = list(string)
  description = "Public Subnet CIDR Values"
}

variable "cidr_private_subnet" {
  type = list(string)
  description = "Private Subnet CIDR Values"
}

variable "eu_availability_zone" {
  type = list(string)
  description = "Network Availability zones"
}