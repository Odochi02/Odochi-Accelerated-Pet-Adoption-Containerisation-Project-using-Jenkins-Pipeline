output "docker_prod_IP" {
  value       = aws_instance.OAPACPUJP_docker_prod.private_ip
  description = "Docker prod public IP"
}

output "docker_prod_lb_dns_name" {
  value       = aws_lb.OAPACPUJP-docker-prod-lb.dns_name
  description = "Docker prod public IP"
}
