#!/bin/bash
echo ECS_CLUSTER=var.ECS_Cluster_name >> /etc/ecs/ecs.config
ECS_AVAILABLE_LOGGING_DRIVERS=["splunk","awslogs"]
