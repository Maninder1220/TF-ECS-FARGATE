# VPC CIDER
variable "vpc_cider_block" {}

# SUBNET
variable "private_subnet" {}
variable "public_subnet" {}

# Public CIDR
variable "public_destination_cider" {}
variable "private_destination_cider" {}

# ROLE
variable "username" {}

# ECR
variable "ecr_repo_name" {}

# TASK
variable "medusa_backend_task" {}

# ECS
variable "ecs_cluster" {}

# SERVICE
variable "ecs_service" {}

variable "cluster_id" {}

variable "task_definition_arn" {}

variable "public_subnet_id" {}

variable "repository_url" {}

variable "ecs_task_execution_role_arn" {}

