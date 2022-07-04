resource "aws_appautoscaling_target" "ecs_target" {


  max_capacity       = 4
  min_capacity       = 1
  resource_id        = "service/${var.cluster_name}/${var.ecs_service_name}"
  scalable_dimension = "ecs:service:DesiredCount"
  service_namespace  = "ecs"
}

