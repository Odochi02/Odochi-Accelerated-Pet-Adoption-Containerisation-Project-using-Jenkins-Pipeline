# creating docker target group
resource "aws_lb_target_group" "OAPACPUJP-docker-prod-tg" {
  name     = "OAPACPUJP-docker-prod-tg"
  port     = 8080
  protocol = "HTTP"
  vpc_id   = var.vpc_id
}
#creating docker prod load balancer target group attachment
resource "aws_lb_target_group_attachment" "OAPACPUJP_docker_prod_tg_attachment" {
  target_group_arn = aws_lb_target_group.OAPACPUJP-docker-prod-tg.arn
  target_id        = aws_instance.OAPACPUJP_docker_prod.id
  port             = 8080
}

# creating docker load balancer
resource "aws_lb" "OAPACPUJP-docker-prod-lb" {
  name               = "OAPACPUJP-docker-prod-lb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [var.docker_prod_lb_sg]
  subnets            = [var.OAPACPUJPpubsub1_id, var.OAPACPUJPpubsub2_id]

  enable_deletion_protection = false


  tags = {
    Environment = "production"
  }
}
#creating load balancer listener
resource "aws_lb_listener" "OAPACPUJP-docker-prod-listener" {
  load_balancer_arn = aws_lb.OAPACPUJP-docker-prod-lb.arn
  port              = "80"                                                   
  /*port = "443"*/
  protocol          = "HTTP"
  /*ssl_policy = "ELBSecurityPolicy-2016-08"*/
  /*certificate_arn = "$(var.acm_certificate)"*/


  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.OAPACPUJP-docker-prod-tg.arn
  }
}




