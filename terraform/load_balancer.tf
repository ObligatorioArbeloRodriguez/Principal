resource "aws_lb" "main" {
  name               = "Obligatorio-lb"
  internal           = false
  load_balancer_type = "application"
  security_groups = [module.networking.lb_security_group_id]
  subnets            = module.networking.public_subnet_ids
}



resource "aws_lb_listener" "http" {
  load_balancer_arn = aws_lb.main.arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    type = "fixed-response"
    fixed_response {
      content_type = "text/plain"
      message_body = "Resource not found"
      status_code  = "404"
    }
  }
}

resource "aws_lb_listener_rule" "orders" {
  listener_arn = aws_lb_listener.http.arn
  priority     = 1
  condition {
    path_pattern {
      values = ["/orders/*"]
    }
  }
  action {
    type               = "forward"
    target_group_arn   = module.networking.orders_target_group_arn
  }
}

resource "aws_lb_listener_rule" "shipping" {
  listener_arn = aws_lb_listener.http.arn
  priority     = 2
  condition {
    path_pattern {
      values = ["/shipping/*"]
    }
  }
  action {
    type               = "forward"
    target_group_arn   = module.networking.shipping_target_group_arn
  }
}

resource "aws_lb_listener_rule" "payments" {
  listener_arn = aws_lb_listener.http.arn
  priority     = 3
  condition {
    path_pattern {
      values = ["/payments/*"]
    }
  }
  action {
    type               = "forward"
    target_group_arn   = module.networking.payments_target_group_arn
  }
}

resource "aws_lb_listener_rule" "products" {
  listener_arn = aws_lb_listener.http.arn
  priority     = 4
  condition {
    path_pattern {
      values = ["/products/*"]
    }
  }
  action {
    type               = "forward"
    target_group_arn   = module.networking.products_target_group_arn
  }
}
