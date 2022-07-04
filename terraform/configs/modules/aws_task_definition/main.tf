resource "aws_ecs_task_definition" "main" {
  family                   = var.ecs_task_definition_name 
  network_mode             = "awsvpc"
  requires_compatibilities = ["FARGATE"]
  cpu                      = var.container_cpu
  memory                   = var.container_memory
  container_definitions = jsonencode([{
    name        = var.container_name
    image       = var.image_name
    essential   = true
    portMappings = [{
      protocol      = "tcp"
      containerPort = var.container_port
      hostPort      = var.container_port
    }]    
  }])

}