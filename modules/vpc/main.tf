resource "aws_vpc" "vpc_bootcamp" {
  cidr_block           = var.vpc_cidr_block
  enable_dns_support   = true
  enable_dns_hostnames = true
  tags = {
    Name = "${var.prefix_name}-VPC"
  }
}

resource "aws_subnet" "private_subnets" {
  vpc_id            = aws_vpc.vpc_bootcamp.id
  cidr_block        = var.private_subnets
  availability_zone = var.az-a
  tags = {
    Name = "${var.prefix_name}-private_subnets"
  }
}

resource "aws_subnet" "public_subnets" {
  vpc_id            = aws_vpc.vpc_bootcamp.id
  cidr_block        = var.public_subnets
  availability_zone = var.az-a
  tags = {
    Name = "${var.prefix_name}-public_subnets"
  }
}

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.vpc_bootcamp.id
  tags = {
    Name = "${var.prefix_name}-igw"
  }
}

resource "aws_route_table" "rt" {
  vpc_id = aws_vpc.vpc_bootcamp.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }
  tags = {
    Name = "${var.prefix_name}-rt"
  }
}

resource "aws_route_table_association" "public_subnets" {
  subnet_id      = aws_subnet.public_subnets.id
  route_table_id = aws_route_table.rt.id
}


