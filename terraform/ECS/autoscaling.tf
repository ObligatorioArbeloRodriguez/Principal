# Auto Scaling Target y Policy para Orders
resource "aws_appautoscaling_target" "be-orders" {
  max_capacity       = 10
  min_capacity       = 1

  resource_id        = "service/${aws_ecs_cluster.main.id}/be-orders-service-${var.environment}"

  scalable_dimension = "ecs:service:DesiredCount"
  service_namespace  = "ecs"

  depends_on = [aws_ecs_service.be-orders]
}

resource "aws_appautoscaling_policy" "scaling_be-orders" {
  name               = "scaling-be-orders-service"

  policy_type        = "TargetTrackingScaling"
  resource_id        = aws_appautoscaling_target.be-orders.id
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
resource "aws_appautoscaling_target" "be-products" {
  max_capacity       = 10
  min_capacity       = 1
 
  resource_id        = "service/${aws_ecs_cluster.main.id}/be-products-service-${var.environment}"

  scalable_dimension = "ecs:service:DesiredCount"
  service_namespace  = "ecs"

  depends_on = [aws_ecs_service.be-products]
}

resource "aws_appautoscaling_policy" "scaling_be-products" {

  name               = "scaling-be-products-service"

  policy_type        = "TargetTrackingScaling"
  resource_id        = aws_appautoscaling_target.be-products.id
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

resource "aws_appautoscaling_target" "be-shipping" {
  max_capacity       = 10
  min_capacity       = 1
  resource_id        = "service/${aws_ecs_cluster.main.id}/be-shipping-service-${var.environment}"

  scalable_dimension = "ecs:service:DesiredCount"
  service_namespace  = "ecs"

  depends_on = [aws_ecs_service.be-shipping]
}

resource "aws_appautoscaling_policy" "scaling_be-shipping" {
  name               = "scaling-be-shipping-service"


  policy_type        = "TargetTrackingScaling"
  resource_id        = aws_appautoscaling_target.be-shipping.id
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

resource "aws_appautoscaling_target" "be-payments" {
  max_capacity       = 10
  min_capacity       = 1
  
  resource_id        = "service/${aws_ecs_cluster.main.id}/be-payments-service-${var.environment}"
  scalable_dimension = "ecs:service:DesiredCount"
  service_namespace  = "ecs"

  depends_on = [aws_ecs_service.be-payments]
}

resource "aws_appautoscaling_policy" "scaling_be-payments" {

  name               = "scaling-be-payments-service"
  policy_type        = "TargetTrackingScaling"
  resource_id        = aws_appautoscaling_target.be-payments.id
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
