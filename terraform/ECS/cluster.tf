resource "aws_ecs_cluster" "main" {
  name = "obligatorio-cluster-${terraform.workspace}"

  setting {
    name  = "containerInsights"
    value = "enabled"
  }
}
