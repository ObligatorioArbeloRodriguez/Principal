resource "aws_lb_target_group" "orders" {
  name     = "orders-tg-${var.environment}"
  port     = 8080
  protocol = "HTTP"
  vpc_id   = data.aws_vpc.main.id
  target_type = "ip"
}

resource "aws_lb_target_group" "shipping" {
  name     = "shipping-tg-${var.environment}"
  port     = 8080
  protocol = "HTTP"
  vpc_id   = data.aws_vpc.main.id
  target_type = "ip"
}

resource "aws_lb_target_group" "payments" {
  name     = "payments-tg-${var.environment}"
  port     = 8080
  protocol = "HTTP"
  vpc_id   = data.aws_vpc.main.id # antes eran asi, aws_vpc.main.id
  target_type = "ip"
}

resource "aws_lb_target_group" "products" {
  name     = "products-tg-${var.environment}"
  port     = 8080
  protocol = "HTTP"
  vpc_id   = data.aws_vpc.main.id
  target_type = "ip"
}
