
resource "aws_lb" "main" {

  name               = var.alb_name 
  internal           = false
  load_balancer_type = "application"
  security_groups    = [var.sg_id_nginx]
  subnets            = var.subnets 
 
  enable_deletion_protection = false
}


