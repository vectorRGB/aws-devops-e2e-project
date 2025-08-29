output "node_app_repo_url" {
  value = aws_ecr_repository.node_app.repository_url
}

output "jenkins_repo_url" {
  value = aws_ecr_repository.jenkins.repository_url
}
