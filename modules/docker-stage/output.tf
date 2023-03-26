output "docker_stage_IP" {
  value       = aws_instance.OAPACPUJP_docker_stage.private_ip
  description = "Docker Stage public IP"
}
