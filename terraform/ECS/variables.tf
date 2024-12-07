variable "subnets" {
  type = map(list(string))
  default = {
    dev  = terraform.workspace == "dev" ? ["subnet-dev-1", "subnet-dev-2"] : []
    prod = terraform.workspace == "prod" ? ["subnet-prod-1", "subnet-prod-2"] : []
    test = terraform.workspace == "test" ? ["subnet-test-1", "subnet-test-2"] : []
  }
}

variable "security_groups" {
  type = map(list(string))
  default = {
    dev = terraform.workspace == "dev" ? ["sg-dev-ecs", "sg-dev-lb"] : []
    prod = terraform.workspace == "test" ? ["sg-test-ecs", "sg-test-lb"] : []
    test =  terraform.workspace == "prod" ? ["sg-prod-ecs", "sg-prod-lb"] : []
}
}

# a chequear


variable "tg_orders" {
    type = string
}

variable "tg_products" {
    type = string
}

variable "tg_shipping" {
    type = string
}

variable "tg_payments" {
    type = string
}
variable "alb_dns_name" {
    type = string
}

variable "accountid" {
  type = string
}

variable "crear_repo" {
  default = false
}

