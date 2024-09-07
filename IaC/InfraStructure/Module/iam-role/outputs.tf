output "username" {
  value = aws_iam_role.ecs_user.id
}

output "ecs_task_execution_role_arn" {
  value = aws_iam_role.ecs_user.arn
}

