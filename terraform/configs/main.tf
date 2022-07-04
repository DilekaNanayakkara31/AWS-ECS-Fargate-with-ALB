provider "aws" {
  #access_key = var.aws-access-key
  #secret_key = var.aws-secret-key
  region     = var.region
  default_tags {
    tags = {
      hashicorp-learn = "refresh"
    }
  }
}




########################## ECS cluster ##########################

module "ecs_cluster"{
  source            = "./modules/aws_ecs"
	cluster_name      = var.cluster_name  
}

########################## ECS cluster task ##########################

module "ecs_cluster_task"{
    source                       = "./modules/aws_task_definition"
    ecs_task_definition_name     = var.ecs_task_definition_name
    container_cpu                = var.container_cpu
    container_memory             = var.container_memory
    container_name               = var.container_name
    image_name                   = var.image_name
    container_port               = var.container_port
}


########################## AWS security groups ##########################

module "aws_security_group"{
    source                       = "./modules/aws_security_group"
    security_groups              = var.security_groups
    vpc_id                       = var.vpc_id
}


########################## AWS ALB ##########################

module "aws_alb"{
    source                       = "./modules/aws_alb"
    alb_name                     = var.alb_name
    subnets                      = var.subnets
    sg_id_nginx                  = module.aws_security_group.sg_id_nginx
}


########################## AWS ALB target group ##########################

module "aws_alb_target_group"{
    source                       = "./modules/aws_alb_target_group"
    target_group_name            = var.target_group_name
    vpc_id                       = var.vpc_id
}

########################## AWS ALB listner ##########################

module "aws_alb_listner"{
    source                       = "./modules/aws_alb_listner"
    lb_id                        = module.aws_alb.lb_id
    tg_arn                       = module.aws_alb_target_group.tg_arn
}

########################## AWS ECS service ##########################

module "aws_ecs_service"{
    source                       = "./modules/aws_ecs_service"
    ecs_service_name             = var.ecs_service_name
    cluster_name                 = var.cluster_name 
    ecs_task_definition_name     = var.ecs_task_definition_name
    ecs_service_desired_count    = var.ecs_service_desired_count
    sg_id_container              = module.aws_security_group.sg_id_container
    subnets                      = var.subnets
    tg_arn                       = module.aws_alb_target_group.tg_arn
    container_port               = var.container_port
    container_name               = var.container_name
}

########################## AWS app autoscaling target ##########################

module "aws_app_autoscaling_target"{
    source                       = "./modules/aws_app_autoscaling_target"
    ecs_service_name             = var.ecs_service_name
    cluster_name                 = var.cluster_name 
}

########################## AWS app autoscaling policy ##########################

module "aws_appautoscaling_policy"{
  source                        = "./modules/aws_app_autoscaling_policy"
  appautoscaling_policies       = var.appautoscaling_policies
  resource_id                   = module.aws_app_autoscaling_target.resource_id
  scalable_dimension            = module.aws_app_autoscaling_target.scalable_dimension
  service_namespace             = module.aws_app_autoscaling_target.service_namespace
}

