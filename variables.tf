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

variable "ecs-task-execution-role-name" {
  default = "ecsTaskExecutionRole"
}

variable "container_name" {
  default = "ehq_v8_node"
}
variable "container_image" {
  default = "v8node:latest"
}