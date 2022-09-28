variable "aws_subnet_public" {
  type = list(string)
  default = [ "subnet-078c624456b4ccd1a", "subnet-090f6c1d1c086bd91" ]

}

variable "app_port" {
  type= number
  default="80"
}

variable "vpc_id" {
  type = string 
  default = "vpc-0a45633edc0801517" 
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


variable "aws_security_group_ecs" {
  type = string
  default = "testapp-ecs-tasks-security-group"
}


variable "health_check_path" {
  default = "/api/monitoring/pulse"
}
