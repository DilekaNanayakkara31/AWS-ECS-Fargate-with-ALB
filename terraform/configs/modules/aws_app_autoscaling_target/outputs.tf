output "resource_id" {
  value = aws_appautoscaling_target.ecs_target.resource_id
}

output "scalable_dimension" {
  value = aws_appautoscaling_target.ecs_target.scalable_dimension
}

output "service_namespace" {
  value = aws_appautoscaling_target.ecs_target.service_namespace
}
