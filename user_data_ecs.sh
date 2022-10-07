#!/bin/bash -xe
exec 1> >(logger -s -t $(basename $0)) 2>&1
yum install -y aws-cfn-bootstrap
yum update -y aws-cfn-bootstrap


#!/bin/bash
sudo echo ECS_CLUSTER=ehq-fe >> /etc/ecs/ecs.config



