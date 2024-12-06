resource "aws_vpc" "main" {
  cidr_block = "10.0.0.0/16"
  tags = {
    Name = "obligatorio-vpc-${terraform.workspace}"
  }
}

resource "aws_internet_gateway" "main" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "obligatorio-igw-${terraform.workspace}"
  }
}


data "aws_availability_zones" "available" {
  state = "available"
}

resource "aws_subnet" "private" {
  count           = length(var.private_subnet_cidr[terraform.workspace])
  vpc_id          = aws_vpc.main.id
  cidr_block      = var.private_subnet_cidr[terraform.workspace][count.index]
  availability_zone = data.aws_availability_zones.available.names[count.index]
  tags = {
    Name = "privada-subnet-${terraform.workspace}-${count.index}"
  }
}

resource "aws_subnet" "public" {
  count                  = length(var.public_subnet_cidr[terraform.workspace])
  vpc_id                 = aws_vpc.main.id
  cidr_block             = var.public_subnet_cidr[terraform.workspace][count.index]
  availability_zone      = data.aws_availability_zones.available.names[count.index]
  map_public_ip_on_launch = true
  tags = {
    Name = "publica-subnet-${terraform.workspace}-${count.index}"
  }
}


