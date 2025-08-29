resource "aws_cloudwatch_log_group" "ecs_logs" {
  name                      = var.log_group_name
  retention_in_days         = 7
  tags                      = var.tags
}

resource "aws_cloudwatch_metric_alarm" "cpu_alarm" {
  alarm_name                = var.alarm_name
  comparison_operator       = var.alarm_comparison_operator
  evaluation_periods        = 2
  metric_name               = var.alarm_metric_name
  namespace                 = var.alarm_namespace
  period                    = var.alarm_period
  statistic                 = "Average"
  threshold                 = var.alarm_threshold
  alarm_description         = "Alarm when CPU exceeds threshold"
  actions_enabled           = false
  tags                      = var.tags
}