# creating docker target group
resource "aws_lb_target_group" "OAPACPUJP-docker-stage-tg" {
  name     = "OAPACPUJP-docker-stage-tg"
  port     = 8080
  protocol = "HTTP"
  vpc_id   = var.vpc_id
}
#creating docker stage load balancer target group attachment
resource "aws_lb_target_group_attachment" "OAPACPUJP-docker-stage_tg_attachment" {
  target_group_arn = aws_lb_target_group.OAPACPUJP-docker-stage-tg.arn
  target_id        = aws_instance.OAPACPUJP_docker_stage.id
  port             = 8080
}

# creating docker load balancer
resource "aws_lb" "OAPACPUJP-docker-stage-lb" {
  name               = "OAPACPUJP-docker-stage-lb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [var.docker_stage_lb_sg]
  subnets            = [var.OAPACPUJPpubsub1_id, var.OAPACPUJPpubsub2_id]

  enable_deletion_protection = false


  tags = {
    Environment = "stageuction"
  }
}
#creating load balancer listener
resource "aws_lb_listener" "OAPACPUJP-docker-stage-listener" {
  load_balancer_arn = aws_lb.OAPACPUJP-docker-stage-lb.arn
  port              = "80"
  protocol          = "HTTP"


  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.OAPACPUJP-docker-stage-tg.arn
  }
}



