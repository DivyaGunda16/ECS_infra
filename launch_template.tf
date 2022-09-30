data "aws_ami" "aws_optimized_ecs" {
  most_recent = true

  filter {
    name   = "name"
    values = ["amzn2-ami-ecs-hvm-*"] // amzn2-ami-ecs-hvm-*,amzn2-ami-ecs-hvm-2.0.20220121-x86_64-ebs
   
  }

  filter {
    name   = "architecture"
    values = ["x86_64"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["amazon"] # AWS
}
resource "aws_launch_template" "launch_template" {
  name = "EC2ContainerService-ehq-fe-EcsInstance_LT"
  image_id = data.aws_ami.aws_optimized_ecs.id//ami-01dee8f614115c3b8
  instance_type = "t3.medium"
  
  block_device_mappings {
    device_name = "/dev/xvda"

    ebs {
      volume_type = "gp2"
      volume_size = "30"
    }
  }
   ebs_optimized = true

  capacity_reservation_specification {
    capacity_reservation_preference = "open"
  }

  cpu_options {
    core_count       = 2
    threads_per_core = 2
  }

  credit_specification {
    cpu_credits = "unlimited"
  }

  iam_instance_profile {
     name = aws_iam_instance_profile.ec2_profile.name
  }

  
  instance_initiated_shutdown_behavior = "terminate"

  instance_market_options {
    market_type = "spot"
  }

  security_group_names = [ aws_security_group.ecs_sg.id, aws_security_group.alb-sg.id ]

  kernel_id = null

  key_name = "btt-ehq-fe"

  /*license_specification {
    license_configuration_arn = "arn:aws:license-manager:eu-west-1:123456789012:license-configuration:lic-0123456789abcdef0123456789abcdef"
  }*/

  metadata_options {
    http_endpoint               = "enabled"
    http_tokens                 = "required"
    http_put_response_hop_limit = 1
    instance_metadata_tags      = "enabled"
  }

  monitoring {
    enabled = true
  }

  network_interfaces {
    associate_public_ip_address = true
  }

  placement {
    availability_zone = "eu-west-1"
  }

  ram_disk_id = null


  tag_specifications {
    resource_type = "instance"

    tags = {
      Name = "ECS Instance - EC2ContainerService-ehq-fe"
    }
  }

  user_data = filebase64("user_data_ecs.sh")
}

