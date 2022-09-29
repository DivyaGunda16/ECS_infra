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

variable "aws_security_group_ecs" {
  type = string
  default = "testapp-ecs-tasks-security-group"
}

variable "vpc_id" {
  type = string 
  default = "vpc-0a45633edc0801517" 
}

variable "app_port" {
  type= number
  default="80"
}

variable "ecs-fe_service" {
  default = "ehq_fe_service"
}

variable "ecs_instance_count" {
  default = "2"
}

variable "aws_subnet_private" {
  type = list(string)
  default = [ "subnet-035832c8142668796", "subnet-0145784503ad5ce61" ]
}

variable "container_port_ecs" {
  default = "3000"
}

variable "aws_appautoscaling_policy" {
  default     = "scale-down"
  description = "Name of Autoscaling policy"
}

//alb
variable "aws_subnet_public" {
  type = list(string)
  default = [ "subnet-078c624456b4ccd1a", "subnet-090f6c1d1c086bd91" ]

}

variable "alb_name" {
  type = string
  default="Staging-ALB-v01"
}  

variable "ALB-TG" {
  type = string
  default="ehq-fe-target-group"
}

variable "protocol" {
  type = string
  default = "HTTP"
}
variable "protocol-version" {
  type = string
  default = "HTTP1"
}
variable "lb-alg-type"{
  type=string
  default="round_robin"
}

variable "aws_security_group" {
  type = string
  default = "testapp-load-balancer-security-group"
}

variable "health_check_path" {
  default = "/api/monitoring/pulse"
}

//nlb

variable "health_check_path_nlb" {
  default = "/"
}

variable "nlb_staging" {
    default = "NLB-Staging-v00"
}

variable "nlb_tg_group1" {
    default = "NLB-TargetGroup-22-v00"
}

variable "nlb_tg_group2" {
 default = "NLB-TargetGroup-443-v00"
}
