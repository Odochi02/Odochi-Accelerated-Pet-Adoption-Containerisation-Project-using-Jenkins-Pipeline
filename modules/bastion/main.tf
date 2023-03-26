# Provisioning Bastion Host
resource "aws_instance" "OAPACPUJP_Bastion_host" {
  ami                       = var.ami_redhat
  instance_type               = var.instance_type
  subnet_id                   = var.OAPACPUJPpubsub1_id
  associate_public_ip_address = true
  vpc_security_group_ids      = [var.bastion_sg]
  key_name                    = var.keypair

  user_data = <<-EOF
#!/bin/bash
echo "${var.prv_key}" > /home/ec2-user/OAPACPUJP_prv
sudo chmod 400 OAPACPUJP_prv
sudo hostnamectl set-hostname Bastion
EOF 

  tags = {
    Name = "Bastion_host"
  }
}