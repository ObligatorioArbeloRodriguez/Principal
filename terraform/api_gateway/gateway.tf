resource "aws_api_gateway_rest_api" "main" {
  name = "obligatorio-api-${var.environment}"
}

resource "aws_api_gateway_resource" "orders" {
  rest_api_id = aws_api_gateway_rest_api.main.id
  parent_id   = aws_api_gateway_rest_api.main.root_resource_id
  path_part   = "orders"
}

resource "aws_api_gateway_resource" "shipping" {
  rest_api_id = aws_api_gateway_rest_api.main.id
  parent_id   = aws_api_gateway_rest_api.main.root_resource_id
  path_part   = "shipping"
}

resource "aws_api_gateway_resource" "payments" {
  rest_api_id = aws_api_gateway_rest_api.main.id
  parent_id   = aws_api_gateway_rest_api.main.root_resource_id
  path_part   = "payments"
}

resource "aws_api_gateway_resource" "products" {
  rest_api_id = aws_api_gateway_rest_api.main.id
  parent_id   = aws_api_gateway_rest_api.main.root_resource_id
  path_part   = "products"
}


resource "aws_api_gateway_method" "orders" {
  rest_api_id   = aws_api_gateway_rest_api.main.id
  resource_id   = aws_api_gateway_resource.orders.id
  http_method   = "POST"
  authorization = "NONE" 
}

resource "aws_api_gateway_method" "shipping" {
  rest_api_id   = aws_api_gateway_rest_api.main.id
  resource_id   = aws_api_gateway_resource.shipping.id
  http_method   = "GET"
  authorization = "NONE"
}

resource "aws_api_gateway_method" "payments" {
  rest_api_id   = aws_api_gateway_rest_api.main.id
  resource_id   = aws_api_gateway_resource.payments.id
  http_method   = "GET"
  authorization = "NONE"
}

resource "aws_api_gateway_method" "products" {
  rest_api_id   = aws_api_gateway_rest_api.main.id
  resource_id   = aws_api_gateway_resource.products.id
  http_method   = "GET"
  authorization = "NONE"
}

#Aca integramos la API Gateway con cada Ms mediante el Load Balancer.

resource "aws_api_gateway_integration" "orders" {
  rest_api_id             = aws_api_gateway_rest_api.main.id
  resource_id             = aws_api_gateway_resource.orders.id
  http_method             = aws_api_gateway_method.orders.http_method
  type                    = "HTTP"
  integration_http_method = "GET"
  uri                     = "http://${var.alb_dns_name}/orders"
}

resource "aws_api_gateway_integration" "shipping" {
  rest_api_id             = aws_api_gateway_rest_api.main.id
  resource_id             = aws_api_gateway_resource.shipping.id
  http_method             = aws_api_gateway_method.shipping.http_method
  type                    = "HTTP"
  integration_http_method = "GET"
  uri                     = "http://${var.alb_dns_name}/shipping"
}

resource "aws_api_gateway_integration" "payments" {
  rest_api_id             = aws_api_gateway_rest_api.main.id
  resource_id             = aws_api_gateway_resource.payments.id
  http_method             = aws_api_gateway_method.payments.http_method
  type                    = "HTTP"
  integration_http_method = "GET"
  uri                     = "http://${var.alb_dns_name}/payments"
}

resource "aws_api_gateway_integration" "products" {
  rest_api_id             = aws_api_gateway_rest_api.main.id
  resource_id             = aws_api_gateway_resource.products.id
  http_method             = aws_api_gateway_method.products.http_method
  type                    = "HTTP"
  integration_http_method = "GET"
  uri                     = "http://${var.alb_dns_name}/products"
}

#Aca desplegamos finalmente el API Gateway

resource "aws_api_gateway_deployment" "main" {
  rest_api_id = aws_api_gateway_rest_api.main.id

  depends_on = [
    aws_api_gateway_integration.orders,
    aws_api_gateway_integration.shipping,
    aws_api_gateway_integration.payments,
    aws_api_gateway_integration.products
  ]
}

resource "aws_api_gateway_stage" "main" {
  stage_name   = var.environment
  rest_api_id  = aws_api_gateway_rest_api.main.id
  deployment_id = aws_api_gateway_deployment.main.id
}


