output "api_gateway_orders_url" {
  description = "Endpoint del API Gateway para el servicio Orders"
  value       = aws_api_gateway_rest_api.main.execution_arn
}

output "api_gateway_shipping_url" {
  description = "Endpoint del API Gateway para el servicio Shipping"
  value       = aws_api_gateway_rest_api.main.execution_arn
}

output "api_gateway_payments_url" {
  description = "Endpoint del API Gateway para el servicio payments"
  value       = aws_api_gateway_rest_api.main.execution_arn
}

output "api_gateway_products_url" {
  description = "Endpoint del API Gateway para el servicio products"
  value       = aws_api_gateway_rest_api.main.execution_arn
}

