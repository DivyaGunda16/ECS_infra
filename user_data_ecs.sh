#!/bin/bash -xe
exec 1> >(logger -s -t $(basename $0)) 2>&1
yum install -y aws-cfn-bootstrap
yum update -y aws-cfn-bootstrap


#!/bin/bash
echo ECS_CLUSTER=ehq-fe > /etc/ecs/ecs.config

# Ensure SSM installed on Amazon Linux",
# in cases where it is not available / removed",

ssm_running=$( ps -ef | grep [a]mazon-ssm-agent | wc -l )
if [[ $ssm_running != \"0\" ]]
then
    echo -e \"amazon-ssm-agent already running\"
else
    if [[ -r \"/tmp/ssm_agent_install\" ]]
    then : 
    else mkdir -p /tmp/ssm_agent_install
    fi
    curl https://s3.amazonaws.com/ec2-downloads-windows/SSMAgent/latest/linux_amd64/amazon-ssm-agent.rpm -o /tmp/ssm_agent_install/amazon-ssm-agent.rpm
    rpm -Uvh /tmp/ssm_agent_install/amazon-ssm-agent.rpm
    ssm_running=$( ps -ef | grep [a]mazon-ssm-agent | wc -l )
    # Amazon Linux 2
    systemctl=$( command -v systemctl | wc -l )
    if [[ $systemctl != \"0\" ]]
    then
        systemctl enable amazon-ssm-agent
        if [[ $ssm_running == \"0\" ]]
        then
            systemctl start amazon-ssm-agent
        fi
    else
        # Amazon Linux
         if [[ $ssm_running == \"0\" ]]
         then
                     start amazon-ssm-agent
         fi
    fi
    
         
         # Helper function
         function exit_cfn_signal {
           exit_status=$?
           if [[ $exit_status != \"0\" && -e /opt/aws/bin/cfn-signal ]]
           then
             /opt/aws/bin/cfn-signal -e $exit_status --stack           
           fi
           exit $exit_status
         }
         trap exit_cfn_signal TERM EXIT
         echo ECS_CLUSTER=
         {
           "Ref": "ECSCluster"
                },
                 >> /etc/ecs/ecs.config
                
                yum install -y python27-pip
                pip install awscli --upgrade
                PATH=$PATH:/usr/local/bin/
fi              
            
		
        