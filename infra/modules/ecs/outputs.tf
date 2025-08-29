output "cluster_id" {
  value = aws_ecs_cluster.main.id
}

output "app_service_arn" {
  value = aws_ecs_service.app_service.arn
}

output "jenkins_service_arn" {
  value = aws_ecs_service.jenkins_service.arn
}
