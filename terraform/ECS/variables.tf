variable "environment" {
    type = string
}

variable "subnets" {
  type = list(string)
}

variable "security_groups" {
  type = list(string)
}

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
