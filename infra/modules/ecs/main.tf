resource "aws_ecs_cluster" "main" {
  name                      = var.cluster_name
  tags                      = var.tags
}

resource "aws_ecs_task_definition" "app" {
  family                    = "node-app"
  network_mode              = "awsvpc"
  requires_compatibilities  = ["FARGATE"]
  cpu                       = "256"
  memory                    = "512"
  execution_role_arn        = var.execution_role_arn
  tags                      = var.tags
  container_definitions     = jsonencode([
    {
      name      = "node-app"
      image     = var.app_image_url
      portMappings = [
        { containerPort = 80, protocol = "tcp" }
      ]
      environment = [
        { name = "NODE_ENV", value = "production" }
      ]
    }
  ])
}

resource "aws_ecs_task_definition" "jenkins" {
  family                    = "jenkins"
  network_mode              = "awsvpc"
  requires_compatibilities  = ["FARGATE"]
  cpu                       = "512"
  memory                    = "1024"
  execution_role_arn        = var.execution_role_arn
  tags                      = var.tags
  container_definitions     = jsonencode([
    {
      name      = "jenkins"
      image     = var.jenkins_image_url
      portMappings = [
        { containerPort = 8080, protocol = "tcp" }
      ]
    }
  ])
}

resource "aws_ecs_service" "app_service" {
  name                      = "node-app-service"
  cluster                   = aws_ecs_cluster.main.id
  task_definition           = aws_ecs_task_definition.app.arn
  desired_count             = 1
  launch_type               = "FARGATE"
  tags                      = var.tags

  network_configuration {
    subnets                 = [var.subnet_id]
    security_groups         = [var.security_group_id]
    assign_public_ip        = true
  }
}

resource "aws_ecs_service" "jenkins_service" {
  name                      = "jenkins-service"
  cluster                   = aws_ecs_cluster.main.id
  task_definition           = aws_ecs_task_definition.jenkins.arn
  desired_count             = 1
  launch_type               = "FARGATE"
  tags                      = var.tags

  network_configuration {
    subnets                 = [var.subnet_id]
    security_groups         = [var.security_group_id]
    assign_public_ip        = true
  }
}