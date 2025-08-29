resource "aws_ecr_repository" "node_app" {
  name = var.node_app_repo_name
  tags = var.tags
}

resource "aws_ecr_repository" "jenkins" {
  name = var.jenkins_repo_name
  tags = var.tags
}