variable "alb_name" {
        type = string
}

variable "sg_id_nginx" {
  type        = string
} 

variable "subnets" {
  type        = list(string)
}

