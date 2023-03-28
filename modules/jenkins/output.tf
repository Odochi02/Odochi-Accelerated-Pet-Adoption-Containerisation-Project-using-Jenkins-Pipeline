output "jenkins_IP" {
  value       = aws_instance.OAPACPUJP_jenkins.private_ip
  description = "jenkins private IP"
}

output "jenkins_lb_dns" {
  value       = aws_lb.OAPACPUJP-jenkins-lb.dns_name
  description = "Docker prod public IP"
}
