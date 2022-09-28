output "alb_hostname" {
  value = aws_alb.alb.dns_name
}


output "security_group-ecs" {
  value = aws_security_group.ecs_sg.id
}

output "security-group-alb" {
  value = aws_security_group.alb-sg.id
}

output "ecs-alb"{
  value = aws_alb_target_group.ALB-TG.arn
}

output "aws-alb-target-group-arn" {
  value = aws_alb_target_group.ALB-TG.arn
}
