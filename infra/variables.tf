# Networking variables
variable "region" {
  description = "AWS region"
  default     = "eu-west-2"
}

variable "az" {
  description = "AWS availability zone"
  default     = "eu-west-2a"
}

variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  default     = "10.0.0.0/16"
}

variable "vpc_name" {
  description = "Name tag for the VPC"
  default     = "devops-vpc"
}

variable "public_subnet_cidr" {
  description = "CIDR block for the public subnet"
  default     = "10.0.1.0/24"
}

variable "sg_name" {
  description = "Name for the security group"
  default     = "ecs-sg"
}

# ECS/IAM variables
variable "ecs_task_execution_role_name" {
  description = "Name for the ECS task execution role"
  default     = "ecsTaskExecutionRole"
}

# Tagging
variable "tags" {
  description = "Common tags to apply to all resources"
  type        = map(string)
}