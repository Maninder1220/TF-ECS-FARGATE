output "key_pair_id" {
  value = aws_key_pair.tf_key.id
}

output "public_key" {
  value = aws_key_pair.tf_key.key_name
}

output "private_key_pem" {
  value = tls_private_key.rsa.private_key_pem
  sensitive = true
}