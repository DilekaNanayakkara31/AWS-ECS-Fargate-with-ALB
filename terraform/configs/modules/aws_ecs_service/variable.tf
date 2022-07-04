variable "ecs_service_name" {
        type = string
}

variable "cluster_name" {
        type = string
        description = "Name of the ECS cluster"
}

variable "ecs_task_definition_name" {
        type = string
        description = "Name of the ECS cluster task"
}

variable "ecs_service_desired_count" {
        type = number
}

variable "container_port" {
        type = number
        description = "container port"
}

variable "container_name" {
        type = string
}

variable "subnets" {
  type        = list(string)
}

variable "sg_id_container" {
  type        = string
}

variable "tg_arn" {
  type        = string
}
