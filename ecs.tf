
//ecr image
/*
resource "docker_image" "image_name" {
  name = var.image
}
resource "docker_container" "container_name" {
  image = docker_image.image_name.name
  name = "v8.node_container"
}


//ecr repo 
resource "aws_ecr_repository" "ecr_repo" {
  name                 =  var.ECR_repo_name

}
//ecr policy
resource "aws_ecr_repository_policy" "ecr_repo_policy" {
  repository = aws_ecr_repository.ecr_repo.name

  policy = <<EOF
{
    "Version": "2008-10-17",
    "Statement": [
        {
            "Sid": "new policy",
            "Effect": "Allow",
            "Principal": "*",
            "Action": [
                "ecr:GetDownloadUrlForLayer",
                "ecr:BatchGetImage",
                "ecr:BatchCheckLayerAvailability",
                "ecr:PutImage",
                "ecr:InitiateLayerUpload",
                "ecr:UploadLayerPart",
                "ecr:CompleteLayerUpload",
                "ecr:DescribeRepositories",
                "ecr:GetRepositoryPolicy",
                "ecr:ListImages",
                "ecr:DeleteRepository",
                "ecr:BatchDeleteImage",
                "ecr:SetRepositoryPolicy",
                "ecr:DeleteRepositoryPolicy"
            ]
        }
    ]
}
EOF
}*/

//ecs cluster
resource "aws_ecs_cluster" "ecs-fe_cluster" {
  name = var.ECS_Cluster_name
  
}


resource "aws_ecs_task_definition" "ecs-fe-def" {
  family                   = "ehq_fe_task"
  execution_role_arn       = aws_iam_role.ecs_task_execution_role.arn
  network_mode             = "bridge"
  requires_compatibilities = ["EC2"]
  cpu                      = 2048
  memory                   = 2048
  container_definitions = jsonencode([
    {
      name      = var.container_name  
      image     = var.container_image       
      cpu       = 0
      //memory    = 470
      memoryReservation = 470
      essential = true
      "environment": [
      {
        name = "NODE_ENV"
        value = "production"
      },
      {
          name = "SENTRY_PUBLIC_DSN"
          value = "https://04b39aec2353486c9652b7181e7f0e3b@sentry.io/133522"
      }
    ],
      portMappings = [
        {
          containerPort = 3000
          hostPort      = 0    
        }
      ]
    }
    
  ])
}


resource "aws_ecs_service" "ecs_service_name" {
  name            = var.ecs-fe_service 
  cluster         = aws_ecs_cluster.ecs-fe_cluster.id
  task_definition = aws_ecs_task_definition.ecs-fe-def.arn
  desired_count   = var.ecs_instance_count
  launch_type     = "EC2"
  scheduling_strategy  = "REPLICA"
  health_check_grace_period_seconds = 30
  deployment_minimum_healthy_percent = 50
  deployment_maximum_percent = 200
  
  /*network_configuration {
    security_groups  = [ aws_security_group.ecs_sg.id ]
    subnets          = var.aws_subnet_private
    assign_public_ip = false
  }*/

  load_balancer {
    target_group_arn = aws_alb_target_group.ALB-TG.id
    container_name   = var.container_name  //ehq_v8_node
    container_port   = var.container_port_ecs //3000

  }

  depends_on = [aws_iam_role.ecs_task_execution_role, aws_iam_role_policy_attachment.ecs-task-execution-role-policy, aws_iam_instance_profile.ec2_instance_profile, aws_alb_target_group.ALB-TG]
}

