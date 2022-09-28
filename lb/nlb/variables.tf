
variable "aws_subnet_public" {
  type = list(string)
  default = [ "subnet-078c624456b4ccd1a", "subnet-090f6c1d1c086bd91s" ]
}

variable "health_check_path" {
  default = "/"
}

variable "vpc_id" {
   type = string  
   default = "vpc-0a45633edc0801517"
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
