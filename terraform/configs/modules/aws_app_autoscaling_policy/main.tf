resource "aws_appautoscaling_policy" "ecs_policy_memory" {


  for_each              = var.appautoscaling_policies

  name               = each.value.appautoscaling_policy_name    
  policy_type        = "TargetTrackingScaling"
  resource_id        = var.resource_id
  scalable_dimension = var.scalable_dimension 
  service_namespace  = var.service_namespace 
 
  target_tracking_scaling_policy_configuration {
   predefined_metric_specification {
     predefined_metric_type = each.value.metric_type  
   }
 
   target_value       = each.value.limit 
  }
}
