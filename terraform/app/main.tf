module "vpc" {
  source = "../modules/vpc"
  vpc_cidr = "10.0.0.0/16"
}

module "subnets" {
  source = "../modules/subnets"
  vpc_id = module.vpc.vpc_id
  cidr_public_subnet = ["10.0.1.0/24", "10.0.2.0/24"]
  cidr_private_subnet = ["10.0.3.0/24", "10.0.4.0/24"]
  eu_availability_zone = ["us-east-1a", "us-east-1b"]
}

module "internet-gateway" {
  source = "../modules/internet-gateway"
  vpc_id = module.vpc.vpc_id
}

module "nat-gateway" {
  source = "../modules/nat-gateway"
  cidr_private_subnet = module.subnets.cidr_private_subnet
}

module "route-table" {
  source = "../modules/route-table"
  vpc_id = module.vpc.vpc_id
  aws_internet_gateway_id = module.internet-gateway.internet_gateway_id
  aws_nat_gateway_id = module.nat-gateway.nat_gateway_id
  cidr_private_subnet = module.subnets.cidr_private_subnet
  aws_nat_gateway = module.nat-gateway.aws_nat_gateway
}

module "route-table-subnets-association" {
  source = "../modules/route-table-subnets-association"
  cidr_public_subnet = module.subnets.cidr_public_subnet
  public_subnet = module.subnets.public_subnet
  public_subnet_id = module.subnets.public_subnet_id
  public_route_table = module.route-table.public_route_table
  public_route_table_id = module.route-table.public_route_table_id
  cidr_private_subnet = module.subnets.cidr_private_subnet
  private_subnet = module.subnets.private_subnet
  private_subnet_id = module.subnets.private_subnet_id
  private_route_table = module.route-table.private_route_table
  private_route_table_id = module.route-table.private_route_table_id
}