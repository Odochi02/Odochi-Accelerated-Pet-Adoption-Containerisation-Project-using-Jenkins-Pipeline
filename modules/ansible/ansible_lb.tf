# creating ansible target group
resource "aws_lb_target_group" "OAPACPUJP-ansible-tg" {
  name     = "OAPACPUJP-ansible-tg"
  port     = 8080
  protocol = "HTTP"
  vpc_id   = var.vpc_id
}
#creating ansible load balancer target group attachment
resource "aws_lb_target_group_attachment" "OAPACPUJP_ansible_lb_tg_attachment" {
  target_group_arn = aws_lb_target_group.OAPACPUJP-ansible-tg.arn
  target_id        = aws_instance.OAPACPUJP_ansible.id
  port             = 8080
}

# creating ansible load balancer
resource "aws_lb" "OAPACPUJP-ansible-lb" {
  name               = "OAPACPUJP-ansible-lb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [var.ansible_lb_sg]
  subnets            = [var.OAPACPUJPpubsub1_id, var.OAPACPUJPpubsub2_id]

  enable_deletion_protection = false


  tags = {
    Environment = "production"
  }
}
#creating load balancer listener
resource "aws_lb_listener" "OAPACPUJP_listener" {
  load_balancer_arn = aws_lb.OAPACPUJP-ansible-lb.arn
  port              = "80"
  protocol          = "HTTP"


  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.OAPACPUJP-ansible-tg.arn
  }
}
