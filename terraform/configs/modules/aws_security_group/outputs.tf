output "sg_id_nginx" {
  value = aws_security_group.alb_and_container["nginx-security-group"].id
}

output "sg_id_container" {
  value = aws_security_group.alb_and_container["container-security-group"].id
}
