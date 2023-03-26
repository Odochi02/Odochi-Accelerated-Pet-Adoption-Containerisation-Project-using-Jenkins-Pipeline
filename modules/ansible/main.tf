#create ansible server 
resource "aws_instance" "OAPACPUJP_ansible" {
  ami                       = var.ami_redhat
  instance_type               = var.instance_type
  subnet_id                   = var.OAPACPUJPpubsub1_id
  associate_public_ip_address = true
  vpc_security_group_ids      = [var.ansible_sg]
  key_name                    = var.keypair
  iam_instance_profile = aws_iam_instance_profile.OAPACPUJP-IAM-profile.id
  
  # Connection Through SSH
  connection {
    type        = "ssh"
    private_key = (var.prv_key)
    user        = "ec2-user"
    host        = self.public_ip
  }
}