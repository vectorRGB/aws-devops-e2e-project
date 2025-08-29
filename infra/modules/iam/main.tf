resource "aws_iam_role" "ecs_task_execution" {
  name                  = var.ecs_task_execution_role_name
  assume_role_policy    = data.aws_iam_policy_document.ecs_task_assume_role_policy.json
  tags                  = var.tags
}

data "aws_iam_policy_document" "ecs_task_assume_role_policy" {
  statement {
    actions             = ["sts:AssumeRole"]
    principals {
      type              = "Service"
      identifiers       = ["ecs-tasks.amazonaws.com"]
    }
  }
}

resource "aws_iam_role_policy_attachment" "ecs_task_execution_policy" {
  role                  = aws_iam_role.ecs_task_execution.name
  policy_arn            = "arn:aws:iam::aws:policy/service-role/AmazonECSTaskExecutionRolePolicy"
}

resource "aws_iam_role_policy_attachment" "jenkins_ecr_access" {
  role                  = aws_iam_role.ecs_task_execution.name
  policy_arn            = "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryFullAccess"
}

resource "aws_iam_role_policy_attachment" "jenkins_ssm_access" {
  role                  = aws_iam_role.ecs_task_execution.name
  policy_arn            = "arn:aws:iam::aws:policy/AmazonSSMReadOnlyAccess"
}

resource "aws_iam_role_policy_attachment" "jenkins_cloudwatch_access" {
  role                  = aws_iam_role.ecs_task_execution.name
  policy_arn            = "arn:aws:iam::aws:policy/CloudWatchLogsFullAccess"
}