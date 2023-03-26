output "Bastionhost_IP" {
  value       = aws_instance.OAPACPUJP_Bastion_host.public_ip
  description = "Bastion host IP"
}