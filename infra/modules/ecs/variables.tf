variable "cluster_name" {
  type        = string
  description = "Name of the ECS cluster"
}

variable "execution_role_arn" {
  type        = string
  description = "ARN of the IAM role for ECS task execution"
}

variable "app_image_url" {
  type        = string
  description = "ECR image URL for the Node.js app"
}

variable "jenkins_image_url" {
  type        = string
  description = "ECR image URL for Jenkins"
}

variable "subnet_id" {
  type        = string
  description = "Subnet ID for ECS service"
}

variable "security_group_id" {
  type        = string
  description = "Security group ID for ECS service"
}

variable "tags" {
  description = "Tags to apply to resources"
  type        = map(string)
}