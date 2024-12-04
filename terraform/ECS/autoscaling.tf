# Auto Scaling Target y Policy para Orders
resource "aws_appautoscaling_target" "orders" {
  max_capacity       = 10
  min_capacity       = 1
  resource_id        = "service/${aws_ecs_cluster.main.id}/orders-service-${var.environment}"
  scalable_dimension = "ecs:service:DesiredCount"
  service_namespace  = "ecs"

  depends_on = [aws_ecs_service.orders]
}

resource "aws_appautoscaling_policy" "scaling_orders" {
  name               = "scaling-orders-service"
  policy_type        = "TargetTrackingScaling"
  resource_id        = aws_appautoscaling_target.orders.id
  scalable_dimension = "ecs:service:DesiredCount"
  service_namespace  = "ecs"

  target_tracking_scaling_policy_configuration {
    target_value = 50.0 
    predefined_metric_specification {
      predefined_metric_type = "ECSServiceAverageCPUUtilization"
    }
    scale_in_cooldown  = 60
    scale_out_cooldown = 60
  }
}

# Auto Scaling Target y Policy para Products
resource "aws_appautoscaling_target" "products" {
  max_capacity       = 10
  min_capacity       = 1
  resource_id        = "service/${aws_ecs_cluster.main.id}/products-service-${var.environment}"
  scalable_dimension = "ecs:service:DesiredCount"
  service_namespace  = "ecs"

  depends_on = [aws_ecs_service.products]
}

resource "aws_appautoscaling_policy" "scaling_products" {
  name               = "scaling-products-service"
  policy_type        = "TargetTrackingScaling"
  resource_id        = aws_appautoscaling_target.products.id
  scalable_dimension = "ecs:service:DesiredCount"
  service_namespace  = "ecs"

  target_tracking_scaling_policy_configuration {
    target_value = 50.0  # Ajusta según el objetivo deseado
    predefined_metric_specification {
      predefined_metric_type = "ECSServiceAverageCPUUtilization"
    }
    scale_in_cooldown  = 60
    scale_out_cooldown = 60
  }
}

resource "aws_appautoscaling_target" "shipping" {
  max_capacity       = 10
  min_capacity       = 1
  resource_id        = "service/${aws_ecs_cluster.main.id}/shipping-service-${var.environment}"
  scalable_dimension = "ecs:service:DesiredCount"
  service_namespace  = "ecs"

  depends_on = [aws_ecs_service.shipping]
}

resource "aws_appautoscaling_policy" "scaling_shipping" {
  name               = "scaling-shipping-service"
  policy_type        = "TargetTrackingScaling"
  resource_id        = aws_appautoscaling_target.shipping.id
  scalable_dimension = "ecs:service:DesiredCount"
  service_namespace  = "ecs"

  target_tracking_scaling_policy_configuration {
    target_value = 50.0  # Ajusta según el objetivo deseado
    predefined_metric_specification {
      predefined_metric_type = "ECSServiceAverageCPUUtilization"
    }
    scale_in_cooldown  = 60
    scale_out_cooldown = 60
  }
}

resource "aws_appautoscaling_target" "payments" {
  max_capacity       = 10
  min_capacity       = 1
  resource_id        = "service/${aws_ecs_cluster.main.id}/payments-service-${var.environment}"
  scalable_dimension = "ecs:service:DesiredCount"
  service_namespace  = "ecs"

  depends_on = [aws_ecs_service.payments]
}

resource "aws_appautoscaling_policy" "scaling_payments" {
  name               = "scaling-payments-service"
  policy_type        = "TargetTrackingScaling"
  resource_id        = aws_appautoscaling_target.payments.id
  scalable_dimension = "ecs:service:DesiredCount"
  service_namespace  = "ecs"

  target_tracking_scaling_policy_configuration {
    target_value = 50.0  # Ajusta según el objetivo deseado
    predefined_metric_specification {
      predefined_metric_type = "ECSServiceAverageCPUUtilization"
    }
    scale_in_cooldown  = 60
    scale_out_cooldown = 60
  }
}
