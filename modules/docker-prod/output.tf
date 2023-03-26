output "docker_prod_IP" {
  value       = aws_instance.OAPACPUJP_docker_prod.private_ip
  description = "Docker prod public IP"
}

output "docker_prod_lb_arn" {
  value       = aws_lb.OAPACPUJP-docker-prod-lb.arn
  description = "Docker prod public IP"
}
