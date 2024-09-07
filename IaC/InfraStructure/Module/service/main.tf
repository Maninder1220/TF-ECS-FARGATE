resource "aws_ecs_service" "my_services" {
  name              = var.ecs_service
  cluster           = var.cluster_id
  task_definition   = var.task_definition_arn
  launch_type       = "FARGATE"
  scheduling_strategy = "REPLICA"
  desired_count     = 2

  network_configuration {
    subnets          = [var.public_subnet_id]
    assign_public_ip = true
  }
}



