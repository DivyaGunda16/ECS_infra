
variable "aws_subnet_public" {
  type = list(string)
  default = [ "value" ]
}

variable "health_check_path" {
  default = "/"
}

variable "vpc_id" {
   type = string  
   default = "vpc-0a45633edc0801517"
}

variable "nlb_staging" {
    
	}
variable "nlb_tg_group1" {
	}
variable "nlb_tg_group2" {
 
	}
