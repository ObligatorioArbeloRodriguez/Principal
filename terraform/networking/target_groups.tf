resource "aws_lb_target_group" "orders" {
  name        = "orders-tg-${terraform.workspace}"
  port        = 8080
  protocol    = "HTTP"
  vpc_id      = aws_vpc.main.id
  target_type = "ip"

  tags = {
    Environment = terraform.workspace
  }
}

resource "aws_lb_target_group" "shipping" {
  name        = "shipping-tg-${terraform.workspace}"
  port        = 8080
  protocol    = "HTTP"
  vpc_id      = aws_vpc.main.id
  target_type = "ip"

  tags = {
    Environment = terraform.workspace
  }
}

resource "aws_lb_target_group" "payments" {
  name        = "payments-tg-${terraform.workspace}"
  port        = 8080
  protocol    = "HTTP"
  vpc_id      = aws_vpc.main.id
  target_type = "ip"

  tags = {
    Environment = terraform.workspace
  }
}

resource "aws_lb_target_group" "products" {
  name        = "products-tg-${terraform.workspace}"
  port        = 8080
  protocol    = "HTTP"
  vpc_id      = aws_vpc.main.id
  target_type = "ip"

  tags = {
    Environment = terraform.workspace
  }
}