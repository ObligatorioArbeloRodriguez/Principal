resource "aws_ecs_service" "orders" {
  name            = "be-orders-service-${var.environment}"
  cluster         = aws_ecs_cluster.main.id
  task_definition = aws_ecs_task_definition.orders.arn
  desired_count   = 5
  deployment_minimum_healthy_percent = 50  
  deployment_maximum_percent = 200 
  launch_type = "FARGATE"
  scheduling_strategy = "REPLICA" 

  force_new_deployment = true

  network_configuration {
    subnets         = var.subnets
    security_groups = var.security_groups
    assign_public_ip = false
  }

  load_balancer {
    target_group_arn = var.tg_orders
    container_name   = "orders"
    container_port   = 8080
  }

   depends_on = [
    aws_ecs_task_definition.orders 
  ]
}

resource "aws_ecs_service" "payments" {
  name            = "be-payments-service-${var.environment}"
  cluster         = aws_ecs_cluster.main.id
  task_definition = aws_ecs_task_definition.payments.arn
  desired_count   = 5
  deployment_minimum_healthy_percent = 50  
  deployment_maximum_percent = 200 
  launch_type = "FARGATE"
  scheduling_strategy = "REPLICA" 

  force_new_deployment = true

  network_configuration {
    subnets         = var.subnets
    security_groups = var.security_groups
    assign_public_ip = false
  }

  load_balancer {
    target_group_arn = var.tg_payments
    container_name   = "payments"
    container_port   = 8080
  }

   depends_on = [
    aws_ecs_task_definition.payments
  ]
}

resource "aws_ecs_service" "shipping" {
  name            = "be-shipping-service-${var.environment}"
  cluster         = aws_ecs_cluster.main.id
  task_definition = aws_ecs_task_definition.shipping.arn
  desired_count   = 5
  deployment_minimum_healthy_percent = 50  
  deployment_maximum_percent = 200 
  launch_type  = "FARGATE"
  scheduling_strategy = "REPLICA" 

  force_new_deployment = true

  network_configuration {
    subnets         = var.subnets
    security_groups = var.security_groups
    assign_public_ip = false
  }

  load_balancer {
    target_group_arn = var.tg_shipping
    container_name   = "shipping"
    container_port   = 8080
  }

  depends_on = [
    aws_ecs_task_definition.shipping
  ]
}

resource "aws_ecs_service" "products" {
  name            = "be-products-service-${var.environment}"
  cluster         = aws_ecs_cluster.main.id
  task_definition = aws_ecs_task_definition.products.arn
  desired_count   = 5
  deployment_minimum_healthy_percent = 50  
  deployment_maximum_percent = 200 
  launch_type  = "FARGATE"
  scheduling_strategy = "REPLICA" 

  force_new_deployment = true

  network_configuration {
    subnets         = var.subnets
    security_groups = var.security_groups
    assign_public_ip = false
  }

  load_balancer {
    target_group_arn = var.tg_products
    container_name   = "products"
    container_port   = 8080
  }

  depends_on = [
    aws_ecs_task_definition.products
  ]
}



