#create jenkins server 
resource "aws_instance" "OAPACPUJP_jenkins" {
  ami                         = var.ami_redhat
  instance_type               = var.instance_type
  subnet_id                   = var.OAPACPUJPprvsub1_id
  associate_public_ip_address = true
  vpc_security_group_ids      = [var.jenkins_sg]
  key_name                    = var.keypair
  
  user_data                   = local.jenkins_user_data

    tags = {
    Name = "OAPACPUJP_jenkins"
  }
}
