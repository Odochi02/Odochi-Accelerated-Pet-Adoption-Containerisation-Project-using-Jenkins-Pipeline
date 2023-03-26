output "ansible_IP" {
  value       = aws_instance.OAPACPUJP_ansible.public_ip
  description = "Ansible public IP"
}