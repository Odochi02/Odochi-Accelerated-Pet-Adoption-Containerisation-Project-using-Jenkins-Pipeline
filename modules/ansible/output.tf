output "ansible_IP" {
  value       = aws_instance.OAPACPUJP_ansible.private_ip
  description = "Ansible private IP"
}

  /*output "ansible_id" {
    value = aws_instance.ansible-server.id

}*/