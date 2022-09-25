variable "region" {
  default = "eu-west-1"
}

variable "ECR_repo_name" {
  default = "v8.node"
}



variable "image" {
    
    default = "divyagunda/demo:latest"
}

variable "ECS_Cluster_name" {
    default = "ecs-fe"
}

variable "ecs_task_execution_role" {
  default = "ecsTaskExecutionRole"
}

variable "container_name " {
  default = "ehq_v8_node"
}
variable "image" {
  default = "v8node:latest"
}