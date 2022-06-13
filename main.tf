# Creating aws network using Terraform

resource "aws_vpc" "Prod-rock-VPC" {
  cidr_block           = var.Prod-rock-VPC-cidr
  instance_tenancy     = "default"
  enable_dns_support   = true
  enable_dns_hostnames = true

  tags = {
    Name = "Prod-rock-VPC"
  }
}

# Creating public subnet 1

resource "aws_subnet" "Test-public-sub_1" {
  vpc_id            = aws_vpc.Prod-rock-VPC.id
  cidr_block        = var.public-subnet1-cidr
  availability_zone = var.AZ1

  tags = {
    Name = "Test-public-sub1 "
  }
}


# creating public subnet 2

resource "aws_subnet" "Test-public-sub_2" {
  vpc_id            = aws_vpc.Prod-rock-VPC.id
  cidr_block        = var.public-subnet2-cidr
  availability_zone = var.AZ2

  tags = {
    Name = "Test-public-sub2 "
  }
}


# creating private subnet 1

resource "aws_subnet" "Test-priv-sub_1" {
  vpc_id            = aws_vpc.Prod-rock-VPC.id
  cidr_block        = var.private-subnet1-cidr
  availability_zone = var.AZ3

  tags = {
    Name = "Test-priv-sub1 "
  }
}


# creating private subnet 2

resource "aws_subnet" "Test-priv-sub_2" {
  vpc_id            = aws_vpc.Prod-rock-VPC.id
  cidr_block        = var.private-subnet2-cidr
  availability_zone = var.AZ4

  tags = {
    Name = "Test-priv-sub2 "
  }
}


# creating a public route table


resource "aws_route_table" "Test-pub-route-table" {
  vpc_id = aws_vpc.Prod-rock-VPC.id

  route = []

  tags = {
    Name = "Test-pub-route-table"
  }
}


# creating a private route table


resource "aws_route_table" "Test-priv-route-table" {
  vpc_id = aws_vpc.Prod-rock-VPC.id

  route = []

  tags = {
    Name = "Test-pub-route-table"
  }
}


# Public subnet association with route table

resource "aws_route_table_association" "Test-pub-association1" {
  subnet_id      = aws_subnet.Test-public-sub_1.id
  route_table_id = aws_route_table.Test-pub-route-table.id
}

resource "aws_route_table_association" "Test-pub-association2" {
  subnet_id      = aws_subnet.Test-public-sub_2.id
  route_table_id = aws_route_table.Test-pub-route-table.id
}

# Private subnet association  with route table

resource "aws_route_table_association" "Test-priv-association1" {
  subnet_id      = aws_subnet.Test-priv-sub_1.id
  route_table_id = aws_route_table.Test-priv-route-table.id
}

resource "aws_route_table_association" "Test-priv-association2" {
  subnet_id      = aws_subnet.Test-priv-sub_2.id
  route_table_id = aws_route_table.Test-priv-route-table.id
}

# Creating internet gateway

resource "aws_internet_gateway" "Test-igw" {
  vpc_id = aws_vpc.Prod-rock-VPC.id

  tags = {
    Name = "Test-igw"
  }
}

# Internet gateway association

resource "aws_route_table_association" "Test-igw-association" {
  gateway_id     = aws_internet_gateway.Test-igw.id
  route_table_id = aws_route_table.Test-pub-route-table.id

}


# creating EIP
resource "aws_eip" "Test-Nat-gateway-eip" {
  vpc = true

}

# Nat gateway
resource "aws_nat_gateway" "Test-Nat-gateway" {
  allocation_id = aws_eip.Test-Nat-gateway-eip.id
  subnet_id     = aws_subnet.Test-public-sub_1.id

  tags = {
    Name = "Test-Nat-gateway"
  }
}



