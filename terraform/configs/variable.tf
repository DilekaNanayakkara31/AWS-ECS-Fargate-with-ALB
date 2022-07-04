variable "aws-access-key" {
  description = "AWS access key"
  type        = string
  #default     = ""
}

variable "aws-secret-key" {
  description = "AWS secret key"
  type        = string
  #default     = ""
}

variable "region" {
  description = "Default region"
  type        = string
  #default     = ""
}

########################## ECS cluster ##########################

variable "cluster_name" {
  description = "name of the ecs cluster"
  type        = string
  #default    = ""
}


########################## ECS cluster task ##########################

variable "ecs_task_definition_name" {
        type = string
        description = "Name of the ECS cluster"
}

variable "container_cpu" {
        type = number
        description = "container CPU size in miliCores"
}

variable "container_memory" {
        type = number
        description = "container memory size in MB"
}

variable "container_name" {
        type = string
        description = "Name of the container"
}

variable "image_name" {
        type = string
        description = "Name of the docker image"
}

variable "container_port" {
        type = number
        description = "container port"
}


########################## AWS security group ##########################

variable "vpc_id" {
        type = string
}

variable "security_groups" {
  description      = "aws security groups"
  type                       = map(object({
      security_group_name = string
      ingress_protocol    = string
      ingress_protocol    = string
      ingress_from_port   = number
      ingress_to_port     = number
      egress_protocol     = string
      egress_from_port    = number
      egress_to_port      = number     
  }))
}


########################## AWS ALB ##########################

variable "alb_name" {
        type = string
}

variable "subnets" {
  type        = list(string)
}



########################## AWS ALB target group ##########################

variable "target_group_name" {
        type = string
}


########################## AWS ECS service ##########################

variable "ecs_service_name" {
        type = string
}

variable "ecs_service_desired_count" {
        type = number
}

########################## AWS app autoscaling target ##########################

variable "resource_id" {
        type        = string
        default     = ""
}

variable "scalable_dimension" {
        type        = string
        default     = ""
}

variable "service_namespace" {
        type        = string
        default     = ""
}


########################## AWS app autoscaling policy ##########################

variable "appautoscaling_policies" {
  description      = "aws security groups"
  type                             = map(object({
      appautoscaling_policy_name   = string 
      metric_type                  = string
      limit                        = number   
  }))
}
