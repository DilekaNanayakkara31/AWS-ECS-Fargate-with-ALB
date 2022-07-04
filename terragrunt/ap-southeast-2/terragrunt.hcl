terraform {
  source = "../../terraform/configs/"
}


inputs = {

aws-access-key          = "################"                                        # add your access key here
aws-secret-key          = "################"                                        # add your secret key here
region                  = "ap-southeast-2"   


cluster_name            = "ap-ecs-cluster"


ecs_task_definition_name = "ap-ecs_cluster_task"
container_cpu            = 256
container_memory         = 512
container_name           = "ap-ecs_container"
image_name               = "nginx:latest"
container_port           = 80


vpc_id                   = "vpc-06df52b577efa79fe"
security_groups = {
    "nginx-security-group" = {
       security_group_name  = "ap-nginx-security-group"
       ingress_protocol     = "tcp"
       ingress_from_port    = 80
       ingress_to_port      = 80
       egress_protocol      = "-1"   
       egress_from_port     = 0 
       egress_to_port       = 0
    },
    "container-security-group" = {
       security_group_name  = "ap-container-security-group"
       ingress_protocol     = "-1" 
       ingress_from_port    = 0
       ingress_to_port      = 0
       egress_protocol      = "-1"   
       egress_from_port     = 0 
       egress_to_port       = 0
    }
}


alb_name                   = "ap-nginx-alb"
subnets                    = ["subnet-0f5489f9806aa20c4", "subnet-0f0e7a9ab2e2a4a76"]


target_group_name          = "ap-nginx-target-group"

ecs_service_name           = "ap-nginx-service"
ecs_service_desired_count  = 1

appautoscaling_policies    = {
    "memory" = {
       appautoscaling_policy_name  = "ap-memory-autoscaling"
       metric_type                 = "ECSServiceAverageMemoryUtilization"
       limit                       = 80
    },
    "cpu" = {
       appautoscaling_policy_name  = "ap-cpu-autoscaling"
       metric_type                 = "ECSServiceAverageCPUUtilization"
       limit                       = 60
    }
}

}

