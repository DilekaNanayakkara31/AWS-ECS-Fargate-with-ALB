resource "aws_security_group" "alb_and_container" {

    for_each              = var.security_groups

  name                    = each.value.security_group_name 
  vpc_id                  = var.vpc_id 
 
  ingress {
   protocol         = each.value.ingress_protocol 
   from_port        = each.value.ingress_from_port 
   to_port          = each.value.ingress_to_port 
   cidr_blocks      = ["0.0.0.0/0"]
   ipv6_cidr_blocks = ["::/0"]
  }
 
 
  egress {
   protocol         = each.value.egress_protocol 
   from_port        = each.value.egress_from_port 
   to_port          = each.value.egress_to_port  
   cidr_blocks      = ["0.0.0.0/0"]
   ipv6_cidr_blocks = ["::/0"]
  }
}


