resource "aws_ecs_service" "main" {


    name                               = var.ecs_service_name 
    cluster                            = var.cluster_name 
    task_definition                    = var.ecs_task_definition_name 
    desired_count                      = var.ecs_service_desired_count 
    deployment_minimum_healthy_percent = 50
    deployment_maximum_percent         = 200
    launch_type                        = "FARGATE"
    scheduling_strategy                = "REPLICA"
    
    network_configuration {
      security_groups  = [var.sg_id_container]
      subnets          = var.subnets 
      assign_public_ip = true
    }
    
    load_balancer {
      target_group_arn = var.tg_arn
      container_name   = var.container_name
      container_port   = var.container_port
    }
    
    lifecycle {
      ignore_changes = [task_definition, desired_count]
    }
   
}