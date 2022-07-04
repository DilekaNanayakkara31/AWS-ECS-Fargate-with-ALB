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

