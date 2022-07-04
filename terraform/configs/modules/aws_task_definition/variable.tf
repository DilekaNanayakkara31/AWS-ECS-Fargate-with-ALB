variable "ecs_task_definition_name" {
        type = string
        description = "Name of the ECS cluster task"
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