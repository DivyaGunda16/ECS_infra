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
    default = "ehq-fe"
}

variable "ecs_task_execution_role" {
  default = "ecsTaskExecutionRole"
}

variable "container_name" {
  default = "ehq_v8_node"
}
variable "container_image" {
  default = "v8node:latest"
}

variable "ecs-fe_service" {
  default = "ehq_fe_service"
}

/*variable "ecs-fe_servicetype" {
  default = "REPLICA"
}*/

variable "ecs_instance_count" {
  default = "2"
}