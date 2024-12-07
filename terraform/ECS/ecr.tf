locals {
  ya_hice_repos = terraform.workspace == "default" ? true : var.crear_repo
}

resource "aws_ecr_repository" "orders" {

  count = local.ya_hice_repos ? 1 : 0
  name                 = "orders-repo"
  image_tag_mutability = "MUTABLE"
  
  image_scanning_configuration {
    scan_on_push = true
  }
}

resource "aws_ecr_repository" "shipping" {

  count = local.ya_hice_repos ? 1 : 0
  name                 = "shipping-repo"
  image_tag_mutability = "MUTABLE"
  
  image_scanning_configuration {
    scan_on_push = true
  }
}

resource "aws_ecr_repository" "products" {

  count = local.ya_hice_repos ? 1 : 0
  name                 = "products-repo"
  image_tag_mutability = "MUTABLE"
  
  image_scanning_configuration {
    scan_on_push = true
  }
}

resource "aws_ecr_repository" "payments" {

  count = local.ya_hice_repos ? 1 : 0
  name                 = "payments-repo"
  image_tag_mutability = "MUTABLE"
  
  image_scanning_configuration {
    scan_on_push = true
  }
}
