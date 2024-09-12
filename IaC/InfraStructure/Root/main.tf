# # # # # NETWORKING # # # # #

# VPC
module "vpc" {
  source = "../Module/vpc"
  vpc_cider_block = var.vpc_cider_block
}

# AZ
module "az" {
  source = "../Module/availability_zone"
}

# SUBNETS
module "subnets" {
  source = "../Module/subnets"
  vpc_id = module.vpc.vpc_id
  private_subnet = var.private_subnet
  public_subnet = var.public_subnet
  random_az = module.az.random_az
}

# NAT GATEWAY
module "nat_gateway" {
  source = "../Module/nat_gateway"
  public_subnet_id = module.subnets.public_subnet_id
}


# INTERNET GATEWAY
module "internet_gateway" {
  source = "../Module/internet_gateway"
  vpc_id = module.vpc.vpc_id
}

# ROUTING
module "routing" {
  source = "../Module/routing"
  vpc_id = module.vpc.vpc_id
  private_destination_cider = var.private_destination_cider
  public_destination_cider =  var.public_destination_cider
  public_subnet_id = module.subnets.public_subnet_id
  private_subnet_id = module.subnets.private_subnet_id
  nat_gateway_id = module.nat_gateway.nat_gateway_id
  ig_id = module.internet_gateway.ig_id
 }

# SECURITY GROUP
module "security_group" {
  source = "../Module/security_group"
  vpc_id = module.vpc.vpc_id
}


# NACL   NEED CHANGES HERE
module "nacl" {
  source = "../Module/nacl"
  vpc_id = module.vpc.vpc_id
  private_subnet_id = module.subnets.private_subnet_id
  public_subnet_id = module.subnets.public_subnet_id
}

# IAM USER
module "iam" {
  source = "../Module/iam-role"
  username    = var.username
}


# ECR
module "ecr" {
  source = "../Module/ecr"
  ecr_repo_name = var.ecr_repo_name
}

# TASK DEFINATION
module "task-defination" {
  source = "../Module/task-defination"
  medusa_backend_task = var.medusa_backend_task
  repository_url = module.ecr.repository_url
  ecs_task_execution_role_arn = module.iam.ecs_task_execution_role_arn
}

# ECS CLUSTER
module "ecs_cluster" {
  source = "../Module/ecs"
  ecs_cluster = var.ecs_cluster
}

# SERVICE
module "ecs_service" {
  source = "../Module/service"
  ecs_service = var.ecs_service
  cluster_id = module.ecs_cluster.cluster_id
  task_definition_arn = module.task-defination.task_definition_arn
  public_subnet_id = module.subnets.public_subnet_id
}


