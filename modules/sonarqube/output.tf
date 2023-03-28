output "sonarqube_IP" {
  value       = aws_instance.OAPACPUJP_sonarqube.public_ip
  description = "sonarqube public IP"
}

