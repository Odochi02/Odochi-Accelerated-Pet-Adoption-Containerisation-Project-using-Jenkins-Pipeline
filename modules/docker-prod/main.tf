#Create Docker Server
resource "aws_instance" "OAPACPUJP_docker_prod" {
  ami                       = var.ami_redhat
  instance_type               = var.instance_type
  subnet_id                   = var.OAPACPUJPprvsub1_id
  associate_public_ip_address = true
  vpc_security_group_ids      = [var.docker-prod_sg]
  key_name                    = var.keypair
  user_data              = local.docker_user_data

  tags = {
    Name = "OAPACPUJP_docker_prod"
  }
}

/*data "aws_secretsmanager_secret_version" "mycred" {
  secret_id = "pass"
}

locals {
  ec2_creds =jsondecode(data.aws_secretsmanager_secret_version.mycred.secret_string)
}*/

/*data "aws_instance" "OAPACPUJP_docker_prod" {
  filter {
    name   = "tag:Name"
    id = 
    values = ["OAPACPUJP_docker_prod"]
  }
  depends_on = [
    aws_instance.OAPACPUJP_docker_prod
  ]
}*/