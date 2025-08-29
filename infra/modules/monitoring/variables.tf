variable "log_group_name" {
  type        = string
  description = "Name of the CloudWatch log group"
  default     = "ecs-node-app-logs"
}

variable "alarm_name" {
  type        = string
  description = "Name of the CloudWatch CPU alarm"
  default     = "ecs-node-app-cpu-alarm"
}

variable "alarm_metric_name" {
  type        = string
  description = "Metric name for the alarm"
  default     = "CPUUtilization"
}

variable "alarm_namespace" {
  type        = string
  description = "Namespace for the alarm metric"
  default     = "AWS/ECS"
}

variable "alarm_threshold" {
  type        = number
  description = "Threshold for the alarm"
  default     = 80
}

variable "alarm_comparison_operator" {
  type        = string
  description = "Comparison operator for the alarm"
  default     = "GreaterThanThreshold"
}

variable "alarm_period" {
  type        = number
  description = "Period in seconds for the alarm evaluation"
  default     = 300
}

variable "tags" {
  description = "Tags to apply to resources"
  type        = map(string)
}