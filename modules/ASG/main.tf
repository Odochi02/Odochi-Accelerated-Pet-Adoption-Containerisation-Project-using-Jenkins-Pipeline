#Add High Availability


#Create launch template
/*resource "aws_launch_template" "OAPACPUJP-lt" {
  name_prefix                 = "OAPACPUJP-lt"
  image_id                    = var.ami_redhat
  instance_type               = var.instance_type

  key_name                    = var.keypair

  monitoring {
    enabled = false
}

  network_interfaces{
  associate_public_ip_address = true
  security_groups             = [var.docker-prod_sg]
  }

}

# Create Autoscaling group
resource "aws_autoscaling_group" "OAPACPUJP-asg" {
  name                      = "OAPACPUJP-asg"
  
  max_size                  = 3
  min_size                  = 2
  health_check_grace_period = 300
  default_cooldown          = 60
  health_check_type         = "EC2"
  desired_capacity          = 2
  force_delete              = true
  vpc_zone_identifier       = var.OAPACPUJPpubsub1_id
  target_group_arns         = [var.OAPACPUJP-tgarn]
 
launch_template {
    id                      = aws_launch_template.OAPACPUJP-lt.id
    version                 = "$Latest"
}

tag {
    key                 = "Name"
    value               = "OAPACPUJP-asg"
    propagate_at_launch = true
  }
}

# create Autoscaling group policy
resource "aws_autoscaling_policy" "OAPACPUJP-asg-pol" {
  name                   = "OAPACPUJP-asg-pol"
  policy_type            = "TargetTrackingScaling"
  adjustment_type        = "ChangeInCapacity"
  autoscaling_group_name = aws_autoscaling_group.SSKEU1-asg.name
  target_tracking_configuration {
    predefined_metric_specification {
      predefined_metric_type = "ASGAverageCPUUtilization"
    }
    target_value = 40
  }
}*/
