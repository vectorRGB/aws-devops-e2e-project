variable "node_app_repo_name" {
    description = "Name for the Node.js app ECR repo"
    type        = string
}

variable "jenkins_repo_name" {
    description = "Name for the Jenkins ECR repo"
    type        = string
}

variable "tags" {
  description = "Tags to apply to resources"
  type        = map(string)
}
