
resource "aws_lb_listener" "NLB_Listener443" {
  load_balancer_arn = aws_lb.NLB.arn
  port              = "443"
  protocol          = "TCP"
  /*
  ssl_policy        = "ELBSecurityPolicy-TLS-1-2-2017-01"
  certificate_arn   = "arn:aws:iam::187416307283:server-certificate/test_cert_rab3wuqwgja25ct3n4jdj2tzu4"
  */
  default_action {
    type             = "forward"
    target_group_arn = aws_alb_target_group.NLB-tg443.arn
  }
}

/*
This is the listener for port 22
*/

resource "aws_lb_listener" "NLB_Listener22" {
  load_balancer_arn = aws_lb.NLB.arn
  port              = "22"
  protocol          = "TCP"
  /*
  ssl_policy        = "ELBSecurityPolicy-TLS-1-2-2017-01"
  certificate_arn   = "arn:aws:iam::187416307283:server-certificate/test_cert_rab3wuqwgja25ct3n4jdj2tzu4"
  */
  default_action {
    type             = "forward"
    target_group_arn = aws_alb_target_group.NLB-tg22.arn
  }
}

resource "aws_lb_listener" "NLB_Listener80" {
  load_balancer_arn = aws_lb.NLB.arn
  port              = "80"
  protocol          = "TCP"
  /*
  ssl_policy        = "ELBSecurityPolicy-TLS-1-2-2017-01"
  certificate_arn   = "arn:aws:iam::187416307283:server-certificate/test_cert_rab3wuqwgja25ct3n4jdj2tzu4"
  */
  default_action {
    type             = "forward"
    target_group_arn = aws_alb_target_group.NLB-tg80.arn
  }
}
