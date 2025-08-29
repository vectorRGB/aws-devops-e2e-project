module "networking" {
  source                    = "./infra/modules/networking"
  vpc_cidr                  = var.vpc_cidr
  vpc_name                  = var.vpc_name
  public_subnet_cidr        = var.public_subnet_cidr
  az                        = var.az
  sg_name                   = var.sg_name
  tags                      = var.tags
}

module "ecr" {
  source                    = "./infra/modules/ecr"
  node_app_repo_name        = "node-app"
  jenkins_repo_name         = "jenkins"
  tags                      = var.tags
}

module "iam" {
  source                    = "./infra/modules/iam"
  tags                      = var.tags
}

module "ecs" {
  source                    = "./infra/modules/ecs"
  cluster_name              = "devops-cluster"
  execution_role_arn        = module.iam.ecs_task_execution_role_arn
  app_image_url             = "${module.ecr.app_repo_url}:latest"
  jenkins_image_url         = "${module.ecr.jenkins_repo_url}:latest"
  subnet_id                 = module.networking.public_subnet_id
  security_group_id         = module.networking.ecs_sg_id
  tags                      = var.tags
}

module "monitoring" {
  source                    = "./infra/modules/monitoring"
  log_group_name            = "ecs-node-app-logs"
  alarm_name                = "ecs-node-app-cpu-alarm"
  alarm_metric_name         = "CPUUtilization"
  alarm_namespace           = "AWS/ECS"
  alarm_threshold           = 80
  alarm_comparison_operator = "GreaterThanThreshold"
  alarm_period              = 300
  tags                      = var.tags
}