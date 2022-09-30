resource "aws_appautoscaling_target" "ecs_target" {
  max_capacity       = 8
  min_capacity       = 1
  resource_id        = "service/${aws_ecs_cluster.ecs-fe_cluster.name}/${aws_ecs_service.ecs_service_name.name}"
  scalable_dimension = "ecs:service:DesiredCount"
  service_namespace  = "ecs"
  
}

resource "aws_autoscaling_group" "ecs_autoscaling" {
  name = "EC2ContainerService-ehq-fe-EcsInstanceAsg-1QGWJOAQTRWZP"
  
}

#Automatically scale capacity up by one
resource "aws_appautoscaling_policy" "ecs_policy_up" {
  name               = var.aws_appautoscaling_policy
  policy_type        = "TargetTrackingScaling"
  resource_id        = "service/${aws_ecs_cluster.ecs-fe_cluster.name}/${aws_ecs_service.ecs_service_name.name}"
  scalable_dimension = aws_appautoscaling_target.ecs_target.scalable_dimension
  service_namespace  = aws_appautoscaling_target.ecs_target.service_namespace

  target_tracking_scaling_policy_configuration {
    predefined_metric_specification {
      predefined_metric_type = "ECSServiceAverageMemoryUtilization"
    }
    target_value = 400
  }
}
