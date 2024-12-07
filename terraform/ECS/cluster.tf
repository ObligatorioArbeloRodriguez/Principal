resource "aws_ecs_cluster" "main" {
  name = "obligatorio-cluster-${var.environment}"

  setting {
    name  = "containerInsights"
    value = "enabled"
  }
}
