
//ecr image

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
}

//ecs cluster
resource "aws_ecs_cluster" "ecs-fe_cluster" {
  name = var.ECS_Cluster_name
  //policy = "aws_iam_policy.ecs_permissions.arn"
}
/*policy = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Action": [
                "ec2:DescribeTags",
                "ecs:CreateCluster",
                "ecs:DeregisterContainerInstance",
                "ecs:DiscoverPollEndpoint",
                "ecs:Poll",
                "ecs:RegisterContainerInstance",
                "ecs:StartTelemetrySession",
                "ecs:UpdateContainerInstancesState",
                "ecs:Submit*",
                "ecr:GetAuthorizationToken",
                "ecr:BatchCheckLayerAvailability",
                "ecr:GetDownloadUrlForLayer",
                "ecr:BatchGetImage",
                "logs:CreateLogStream",
                "logs:PutLogEvents"
            ],
            "Resource": "*"
        }
    ]
}
EOF
}*/

/*resource "aws_ecs_task_definition" "ecs-fe-def" {
  family                   = "ehq_fe_task"
  execution_role_arn       = aws_iam_role.ecs_task_execution_role.arn
  network_mode             = "bridge"
  requires_compatibilities = ["EXTERNAL","EC2"]
  cpu                      = null
  memory                   = null
  container_definitions = jsonencode([
    {
      name      = var.container_name  
      image     = var.container_image       
      cpu       = 0
      memory    = 470
      essential = true
      "environment": [
      {
        name = "NODE_ENV"
       //"VARNAME", 
       value = "production"
       //"VARVAL"
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
}*/
depends_on = [aws_iam_role_policy_attachment.ecs_task_execution_role]