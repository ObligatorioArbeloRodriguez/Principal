module "API_gateway" {
    source = "./api_gateway"
    environment = var.environment
    alb_dns_name = aws_lb.main.dns_name
}

module "ECS" {
    source = "./ECS"
    environment = var.environment
    subnets = module.networking.public_subnet_ids
    security_groups = [module.networking.ecs_security_group_id]
    tg_payments = module.networking.payments_target_group_arn
    tg_shipping = module.networking.shipping_target_group_arn
    tg_products = module.networking.products_target_group_arn
    tg_orders = module.networking.orders_target_group_arn
    alb_dns_name = aws_lb.main.dns_name
}

module "networking" {
    source = "./networking"
    environment = var.environment 
}


module "S3" {
    source = "./S3"
    environment = var.environment
}



