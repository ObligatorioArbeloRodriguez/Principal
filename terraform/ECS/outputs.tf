output "ecs_cluster_arn" {
  description = "ARN del clúster ECS"
  value       = aws_ecs_cluster.main.arn
}

