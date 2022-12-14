resource "aws_autoscaling_group" "autoscaling_group" {
  name                      = "EC2ContainerService-ehq-fe-EcsInstanceAsg"
  availability_zones = [ "eu-west-1a" ]
  max_size                  = 8
  min_size                  = 1
  health_check_grace_period = 0
  health_check_type         = "EC2"
  desired_capacity          = 2
  force_delete              = true
  //vpc_zone_identifier       = var.aws_subnet_private
  target_group_arns = [ aws_alb_target_group.ALB-TG.arn ]

  launch_template {
    id = aws_launch_template.launch_template.id
    version = aws_launch_template.launch_template.latest_version
  }
}


resource "aws_appautoscaling_target" "ecs_target" {
  max_capacity       = 15
  min_capacity       = 2
  resource_id        = "service/${aws_ecs_cluster.ecs-fe_cluster.name}/${aws_ecs_service.ecs_service_name.name}"
  scalable_dimension = "ecs:service:DesiredCount"
  service_namespace  = "ecs"
}


#Automatically scale capacity up by one
resource "aws_appautoscaling_policy" "ecs_policy_up" {
  name               = var.aws_appautoscaling_policy
  policy_type        = "TargetTrackingScaling"
  resource_id        = aws_appautoscaling_target.ecs_target.resource_id
  scalable_dimension = aws_appautoscaling_target.ecs_target.scalable_dimension
  service_namespace  = aws_appautoscaling_target.ecs_target.service_namespace

  target_tracking_scaling_policy_configuration {
    predefined_metric_specification {
      predefined_metric_type = "ECSServiceAverageMemoryUtilization"
    }
    target_value = 400
  }
}
