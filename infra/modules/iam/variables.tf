variable "ecs_task_execution_role_name" {
  type        = string
  description = "Name for the ECS task execution role"
  default     = "ecsTaskExecutionRole"
}

variable "tags" {
  description = "Tags to apply to resources"
  type        = map(string)
}
