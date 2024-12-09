resource "aws_ecs_task_definition" "orders" {
  family                   = "orders-${var.environment}"
  network_mode             = "awsvpc"
  requires_compatibilities = ["FARGATE"]
  cpu                      = "256"
  memory                   = "512"
  execution_role_arn       = "arn:aws:iam::${var.accountid}:role/LabRole"
  task_role_arn            = "arn:aws:iam::${var.accountid}:role/LabRole"

  container_definitions = jsonencode([
    {
      name      = "orders"
      image     = "${var.accountid}.dkr.ecr.us-east-1.amazonaws.com/orders-repo:latest"
      essential = true
      portMappings = [
        {
          containerPort = 8080
          hostPort      = 8080
          protocol      = "tcp"
        }
      ]
      logConfiguration = {
      logDriver = "awslogs"
      options = {
        awslogs-create-group  = "true"              
        awslogs-group         = "/ecs/orders-logs" 
        awslogs-region        = "us-east-1"           
        awslogs-stream-prefix = "orders"       
      }
       environment = [
      {
        name  = "APP_ARGS"
        value = "http://${var.alb_dns_name}/payments http://${var.alb_dns_name}/shipping http://${var.alb_dns_name}/products"
      }
    ]
    }
    }
  ])
 
  runtime_platform {
    cpu_architecture      = "ARM64"
    operating_system_family = "LINUX"
  }
}

resource "aws_ecs_task_definition" "products" {
  family                   = "products-${var.environment}"
  network_mode             = "awsvpc"
  requires_compatibilities = ["FARGATE"]
  cpu                      = "256"
  memory                   = "512"
  execution_role_arn       = "arn:aws:iam::${var.accountid}:role/LabRole"
  task_role_arn            = "arn:aws:iam::${var.accountid}:role/LabRole"

  container_definitions = jsonencode([
    {
      name      = "products"
      image     = "${var.accountid}.dkr.ecr.us-east-1.amazonaws.com/products-repo:latest"
      essential = true
      portMappings = [
        {
          containerPort = 8080
          hostPort      = 8080
          protocol      = "tcp"
        }
      ]
      logConfiguration = {
      logDriver = "awslogs"
      options = {
        awslogs-create-group  = "true"              
        awslogs-group         = "/ecs/products-logs" 
        awslogs-region        = "us-east-1"           
        awslogs-stream-prefix = "products"       
      }
    }
    }
  ])
  runtime_platform {
    cpu_architecture      = "ARM64"
    operating_system_family = "LINUX"
  }
}

resource "aws_ecs_task_definition" "shipping" {
  family                   = "shipping-${var.environment}"
  network_mode             = "awsvpc"
  requires_compatibilities = ["FARGATE"]
  cpu                      = "256"
  memory                   = "512"
  execution_role_arn       = "arn:aws:iam::${var.accountid}:role/LabRole"
  task_role_arn            = "arn:aws:iam::${var.accountid}:role/LabRole"

  container_definitions = jsonencode([
    {
      name      = "shipping"
      image     = "${var.accountid}.dkr.ecr.us-east-1.amazonaws.com/shipping-repo:latest"
      essential = true
      portMappings = [
        {
          containerPort = 8080
          hostPort      = 8080
          protocol      = "tcp"
        }
      ]
      logConfiguration = {
      logDriver = "awslogs"
      options = {
        awslogs-create-group  = "true"              
        awslogs-group         = "/ecs/shipping-logs" 
        awslogs-region        = "us-east-1"           
        awslogs-stream-prefix = "shipping"       
      }
    }
    }
  ])
  runtime_platform {
    cpu_architecture      = "ARM64"
    operating_system_family = "LINUX"
  }
}

resource "aws_ecs_task_definition" "payments" {
  family                   = "payments-${var.environment}"
  network_mode             = "awsvpc"
  requires_compatibilities = ["FARGATE"]
  cpu                      = "256"
  memory                   = "512"
  execution_role_arn       = "arn:aws:iam::${var.accountid}:role/LabRole"
  task_role_arn            = "arn:aws:iam::${var.accountid}:role/LabRole"

  container_definitions = jsonencode([
    {
      name      = "payments"
      image     = "${var.accountid}.dkr.ecr.us-east-1.amazonaws.com/payments-repo:latest"
      essential = true
      portMappings = [
        {
          containerPort = 8080
          hostPort      = 8080
          protocol      = "tcp"
        }
      ]
    }
  ])
  runtime_platform {
    cpu_architecture      = "ARM64"
    operating_system_family = "LINUX"
  }
}

