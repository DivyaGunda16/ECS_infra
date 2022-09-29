resource "aws_lb" "NLB" {
  name               = var.nlb_staging
  internal           = false
  load_balancer_type = "network"
  subnets            = var.aws_subnet_public

  /*
  enable_deletion_protection = true
*/
  tags = {
    Environment = "Staging"
  }
}



resource "aws_alb_target_group" "NLB-tg443" {
  name        = var.nlb_tg_group1
  port        = 443
  protocol    = "TCP"
  target_type = "ip"
  vpc_id      = var.vpc_id
  deregistration_delay = 30

  health_check {
    healthy_threshold   = 5
    unhealthy_threshold = 5
    path                = var.health_check_path_nlb
    interval            = 30

  }
}

resource "aws_alb_target_group" "NLB-tg22" {
  name        = var.nlb_tg_group2
  port        = 22
  protocol    = "TCP"
  target_type = "ip"
  vpc_id      = var.vpc_id
  deregistration_delay = 30

  health_check {
    healthy_threshold   = 5
    unhealthy_threshold = 5
    protocol            = "TCP"

  }
}

resource "aws_alb_target_group" "NLB-tg80" {
  name        = var.nlb_tg_group3
  port        = 80
  protocol    = "TCP"
  target_type = "ip"
  vpc_id      = var.vpc_id
  deregistration_delay = 30

  health_check {
    healthy_threshold   = 5
    unhealthy_threshold = 5
    protocol            = "TCP"

  }
}
