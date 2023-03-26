output "jenkins_IP" {
  value       = aws_instance.OAPACPUJP_jenkins.public_ip
  description = "jenkins public IP"
}

output "jenkins_lb_arn" {
  value       = aws_lb.OAPACPUJP-jenkins-lb.arn
  description = "Docker prod public IP"
}