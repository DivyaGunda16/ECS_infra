//ecr repo 
resource "aws_ecr_repository" "ecr_repo" {
  name                 =  var.ECR_repo_name
 // registry_id        =  var.ecr_registry_id

  //image_scanning_configuration {
   // scan_on_push = true
  //}
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

//ecr image
//data "aws_ecr_image" "ecr_repo_image" {
//  repository_name = aws_ecr_repository.ecr_repo.name
//  image_tag       = "latest"
//}


