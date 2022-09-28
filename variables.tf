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


variable "ecs_instance_count" {
  default = "2"
}

variable "aws-alb-target-group-arn" {
  type = string
  default="ehq-fe-target-group"
}

variable "container_port_ecs" {
  default = "3000"
}

variable "aws_subnet_private" {
  type = list(string)
  default = [ "subnet-035832c8142668796", "subnet-0145784503ad5ce61" ]
}

variable "security_group-ecs" {
  type = string
  default = "testapp-ecs-tasks-security-group"
}