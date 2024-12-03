resource "aws_vpc" "main" {
  cidr_block = "10.0.0.0/16"
  tags = {
    Name = "obligatorio-vpc"
  }
}

resource "aws_internet_gateway" "main" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "obligatorio-igw"
  }
}


data "aws_availability_zones" "available" {
  state = "available"
}

#AGREGADO

resource "aws_subnet" "main" {
  count           = 2
  vpc_id          = aws_vpc.main.id
  cidr_block      = "10.0.${count.index}.0/24"
  availability_zone = data.aws_availability_zones.available.names[count.index]
  tags = {
    Name = "privada-subnet-${count.index}"
  }
}
#AGREGADO

resource "aws_subnet" "public" {
  count                  = length(var.public_subnet_cidr) #modificado para intentar arreglar la discrepancia del valor del index de linea 28.
  vpc_id                 = aws_vpc.main.id
  cidr_block             = var.public_subnet_cidr[count.index]
  availability_zone      = data.aws_availability_zones.available.names[count.index]
  map_public_ip_on_launch = true
  tags = {
    Name = "obligatorio-subnet-${count.index}"
  }
}


