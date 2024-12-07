
variable "public_subnet_cidr" {
  type = map(list(string))
  default = {
    dev     = ["10.0.1.0/24", "10.0.2.0/24"]
    staging = ["10.0.3.0/24", "10.0.4.0/24"]
    prod    = ["10.0.5.0/24", "10.0.6.0/24"]
  }
}

variable "private_subnet_cidr" {
  type = map(list(string))
  default = {
    dev     = ["10.0.7.0/24", "10.0.8.0/24"]
    staging = ["10.0.9.0/24", "10.0.10.0/24"]
    prod    = ["10.0.11.0/24", "10.0.12.0/24"]
  }
}