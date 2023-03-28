#create ansible server 
resource "aws_instance" "OAPACPUJP_ansible" {
  ami                       = var.ami_ubuntu
  instance_type               = var.instance_type
  subnet_id                   = var.OAPACPUJPprvsub1_id
  associate_public_ip_address = true
  vpc_security_group_ids      = [var.ansible_sg]
  key_name                    = var.keypair
  iam_instance_profile = aws_iam_instance_profile.OAPACPUJP-IAM-profile.id
  user_data                   = local.ansible_user_data
  
  # Connection Through SSH
  connection {
    type        = "ssh"
    private_key = (var.prv_key)
    user        = "ubuntu"
    host        = self.public_ip
  }

  /*provisioner "file" {
    source      = "../../modules/ansible/docker-image.yml"
    destination = "/home/ec2-user/docker-image.yml"
  }

   provisioner "file" {
    source      = "../../modules/ansible/docker-prod.yml"
    destination = "/home/ec2-user/docker-prod.yml"
  }


   provisioner "file" {
    source      = "../../modules/ansible/docker-stage.yml"
    destination = "/home/ec2-user/docker-stage.yml"
  }*/

 

  tags = {
    Name = "OAPACPUJP_ansible"
  }

}


/*data "aws_secretsmanager_secret_version" "mycred" {
  secret_id = "dre-pass"
}

locals {
  ec2_creds =jsondecode(data.aws_secretsmanager_secret_version.mycred.secret_string)
}*/