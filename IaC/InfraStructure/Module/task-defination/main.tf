resource "aws_ecs_task_definition" "ecs_task" {
  family                   = var.medusa_backend_task
  network_mode             = "awsvpc"
  requires_compatibilities = ["FARGATE"]
  
  # Overall CPU and memory
  memory                   = "16384"  # 15GB
  cpu                      = "4096"   # 8CPU

  container_definitions = jsonencode([{
    name      = "medusa_backend_task_def"
    image     = "${var.repository_url}"
    essential = true

    # Container CPU and memory
    memory    = 5120  # 5GB
    cpu       = 2048  # 4CPU

    portMappings = [{
      containerPort = 7001  # as per medusa-backend
      hostPort      = 7001  # as per medusa-backend
    }]
  }])
  execution_role_arn = var.ecs_task_execution_role_arn
}
