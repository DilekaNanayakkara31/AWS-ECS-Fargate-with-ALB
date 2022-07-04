variable "appautoscaling_policies" {
  description      = "aws security groups"
  type                             = map(object({
      appautoscaling_policy_name   = string 
      metric_type                  = string
      limit                        = number   
  }))
}

variable "resource_id" {
        type = string
}


variable "scalable_dimension" {
        type = string
}

variable "service_namespace" {
        type = string
}
