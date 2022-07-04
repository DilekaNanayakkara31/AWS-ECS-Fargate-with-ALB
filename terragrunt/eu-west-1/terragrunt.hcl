terraform {
  source = "../../terraform/configs/"
}


inputs = {
aws-access-key          = "################"               # add your access key here
aws-secret-key          = "################"               # add your secret key here
region                  = "eu-west-1"


cluster_name            = "eu-ecs-cluster"


ecs_task_definition_name = "eu-ecs_cluster_task"
container_cpu            = 256
container_memory         = 512
container_name           = "eu-ecs_container"
image_name               = "nginx:latest"
container_port           = 80


vpc_id                   = "vpc-00f512f4d144937c4"
security_groups = {
    "nginx-security-group" = {
       security_group_name  = "eu-nginx-security-group"
       ingress_protocol     = "tcp"
       ingress_from_port    = 80
       ingress_to_port      = 80
       egress_protocol      = "-1"   
       egress_from_port     = 0 
       egress_to_port       = 0
    },
    "container-security-group" = {
       security_group_name  = "eu-container-security-group"
       ingress_protocol     = "-1" 
       ingress_from_port    = 0
       ingress_to_port      = 0
       egress_protocol      = "-1"   
       egress_from_port     = 0 
       egress_to_port       = 0
    }
}


alb_name                   = "eu-nginx-alb"
subnets                    = ["subnet-0e09b2598936ac5f3", "subnet-07bf7686c64d678e3"]


target_group_name          = "eu-nginx-target-group"

ecs_service_name           = "eu-nginx-service"
ecs_service_desired_count  = 1

appautoscaling_policies    = {
    "memory" = {
       appautoscaling_policy_name  = "eu-memory-autoscaling"
       metric_type                 = "ECSServiceAverageMemoryUtilization"
       limit                       = 80
    },
    "cpu" = {
       appautoscaling_policy_name  = "eu-cpu-autoscaling"
       metric_type                 = "ECSServiceAverageCPUUtilization"
       limit                       = 60
    }
}

}

