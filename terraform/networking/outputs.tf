output "lb_security_group_id" {
  value = aws_security_group.lb.id
}

output "ecs_security_group_id" {
  value = aws_security_group.ecs.id
}

output "orders_target_group_arn" {
  value = aws_lb_target_group.orders.arn
}

output "shipping_target_group_arn" {
  value = aws_lb_target_group.shipping.arn
}

output "payments_target_group_arn" {
  value = aws_lb_target_group.payments.arn
}

output "products_target_group_arn" {
  value = aws_lb_target_group.products.arn
}

output "public_subnet_ids" {
  value = aws_subnet.public[*].id
}



