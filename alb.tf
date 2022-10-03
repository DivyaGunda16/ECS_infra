#in this template we are creating aws application laadbalancer and target group and alb http listener

resource "aws_alb" "alb" {
  name               = var.alb_name
  load_balancer_type ="application"
  internal           = true
  subnets            = var.aws_subnet_public
  security_groups    = [aws_security_group.alb-sg.id]
  enable_deletion_protection = true
   access_logs {
    bucket  = rax-staging-alb-s3bucketwithlogging-17kxxo885zto
    //prefix  = "test-lb"
    enabled = true
  }
}

resource "aws_alb_target_group" "ALB-TG" {
  name        = var.ALB-TG
  port        = var.app_port
  protocol    = var.protocol
  protocol_version=var.protocol-version
  //target_type = "instance"
  vpc_id      = var.vpc_id
  deregistration_delay = 300
  load_balancing_algorithm_type = var.lb-alg-type

  health_check {
    
    healthy_threshold   = "2"
    unhealthy_threshold = "2"
    timeout             = "5"
    //port                = var.app_port
    protocol            = var.protocol
    matcher             = "200"
    path                = var.health_check_path
    interval            = "30"

  }
}

#redirecting all incomming traffic from ALB to the target group
resource "aws_alb_listener" "testapp" {
  load_balancer_arn = aws_alb.alb.id
  port              = var.app_port
  protocol          = var.protocol
  #ssl_policy        = "ELBSecurityPolicy-2016-08"
  #certificate_arn   = "arn:aws:iam::187416307283:server-certificate/test_cert_rab3wuqwgja25ct3n4jdj2tzu4"
  #enable above 2 if you are using HTTPS listner and change protocal from HTTPS to HTTPS
  default_action {
    type             = "forward"
    target_group_arn = aws_alb_target_group.ALB-TG.arn
  }
}
