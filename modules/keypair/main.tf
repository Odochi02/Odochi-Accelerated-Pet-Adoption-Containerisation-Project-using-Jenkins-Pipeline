# create KeyPair 
resource "tls_private_key" "OAPACPUJP_key" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "local_file" "OAPACPUJP_prv" {
  content  = tls_private_key.OAPACPUJP_key.private_key_pem
  filename = "OAPACPUJP_prv"
}


resource "aws_key_pair" "OAPACPUJP_pub_key" {
  key_name   = "OAPACPUJP_pub_key"
  public_key = tls_private_key.OAPACPUJP_key.public_key_openssh
}