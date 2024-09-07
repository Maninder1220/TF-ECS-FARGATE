vpc_cider_block = "10.0.0.0/16"
private_subnet = "10.0.1.0/24"
public_subnet = "10.0.3.0/24"


public_destination_cider = "0.0.0.0/0"
private_destination_cider = "0.0.0.0/0"

username    = "ecs-task-execution-role"

ecr_repo_name = "ecr-repo"

medusa_backend_task="medusa_backend-task"

ecs_cluster = "medusa_ecs_cluster"

ecs_service = "ecs_service"
