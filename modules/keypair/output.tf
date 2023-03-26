output "OAPACPUJP_pub_key" {
  value = aws_key_pair.OAPACPUJP_pub_key.key_name
}

output "prv_key" {
  value = tls_private_key.OAPACPUJP_key.private_key_pem
}
