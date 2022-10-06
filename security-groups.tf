# this security group for ecs - Traffic to the ECS cluster should only come from the ALB
resource "aws_security_group" "ecs_sg" {
  name        = var.aws_security_group_ecs
  description = "allow inbound access from the ALB only"
  vpc_id      = var.vpc_id

  ingress {
    protocol    = "-1"
    from_port   = 0
    to_port     = 0
    security_groups = [aws_security_group.alb-sg.id]
    
  }

  ingress {
    description = "Access from ALB to ECS"
    protocol        = "tcp"
    from_port       = var.app_port
    to_port         = var.app_port
    cidr_blocks     = ["0.0.0.0/0"]
  }

  egress {
    protocol    = "-1"
    from_port   = 0
    to_port     = 0
    cidr_blocks = ["0.0.0.0/0"]
  }
}
# alb security group

resource "aws_security_group" "alb-sg" {
  name        = var.aws_security_group
  description = "Staging - Internal ALB Ingress Security Group"
  vpc_id      = var.vpc_id

  ingress {
    protocol    = "-1"
    from_port   = 0
    to_port     = 0
    cidr_blocks = ["0.0.0.0/0"]
 
  }

  ingress {
    description = "Access from OpenResty"
    protocol    = "tcp"
   from_port       = "1024" 
   to_port         = "65535"
    //cidr_blocks = ["0.0.0.0/0"]
  security_groups = [aws_security_group.ecs_sg.id]
  }

  egress {
    protocol    = "-1"
    from_port   = 0
    to_port     = 0
    cidr_blocks = ["0.0.0.0/0"]
  }
}
