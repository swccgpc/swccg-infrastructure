
resource "aws_iam_role" "ecs_task_execution_role" {
  name = "ecs-task-execution-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [{
        Action    = "sts:AssumeRole"
        Effect    = "Allow"
        Sid       = ""
        Principal = { Service = "ecs-tasks.amazonaws.com" }
      }]
  })

  managed_policy_arns = ["arn:aws:iam::aws:policy/service-role/AmazonECSTaskExecutionRolePolicy",
                         "arn:aws:iam::aws:policy/CloudWatchLogsFullAccess"]

  tags = {
    Name = "ecs-task-execution-role"
  }

} ## resource aws_iam_role ecs_task_execution_role
