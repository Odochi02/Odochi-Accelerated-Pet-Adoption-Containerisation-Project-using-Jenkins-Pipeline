output "ansible_IP" {
  value       = module.ansible.ansible_IP
  description = "Ansible public IP"
}

output "jenkins_public_ip" {
  value       = module.jenkins.jenkins_IP
  description = "jenkins public IP"

}

output "docker_prod_IP" {
  value       = module.docker-prod.docker_prod_IP
  description = "Docker prod public IP"
}

output "docker_stage_IP" {
  value       = module.docker-stage.docker_stage_IP
  description = "Docker stage public IP"
}

output "docker_prod_lb_arn" {
  value       = module.docker-prod.docker_prod_lb_arn
  description = "Docker prod arn"
}

output "sonarqube_IP" {
  value       = module.sonarqube.sonarqube_IP
  description = "SonarQube public IP"
}

output "bastion_IP" {
  value       = module.bastion.Bastionhost_IP
  description = "Bastion IP"
}

output "jenkins_lb_arn" {
  value       = module.jenkins.jenkins_lb_arn
  description = "Jenkins lb arn"
}
