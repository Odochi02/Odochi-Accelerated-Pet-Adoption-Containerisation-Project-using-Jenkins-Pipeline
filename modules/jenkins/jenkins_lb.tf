# creating jenkins target group
resource "aws_lb_target_group" "OAPACPUJP-jenkins-tg" {
  name     = "OAPACPUJP-jenkins-tg"
  port     = 8080
  protocol = "HTTP"
  vpc_id   = var.vpc_id
}
#creating jenkins load balancer target group attachment
resource "aws_lb_target_group_attachment" "OAPACPUJP_jenkins_lb_tg_attachment" {
  target_group_arn = aws_lb_target_group.OAPACPUJP-jenkins-tg.arn
  target_id        = aws_instance.OAPACPUJP_jenkins.id
  port             = 8080
}

# creating jenkins load balancer
resource "aws_lb" "OAPACPUJP-jenkins-lb" {
  name               = "OAPACPUJP-jenkins-lb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [var.jenkins_lb_sg]
  subnets            = [var.OAPACPUJPpubsub1_id, var.OAPACPUJPpubsub2_id]

  enable_deletion_protection = false


  tags = {
    Environment = "production"
  }
}
#creating load balancer listener
resource "aws_lb_listener" "OAPACPUJP_listener" {
  load_balancer_arn = aws_lb.OAPACPUJP-jenkins-lb.arn
  port              = "80"
  protocol          = "HTTP"


  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.OAPACPUJP-jenkins-tg.arn
  }
}
