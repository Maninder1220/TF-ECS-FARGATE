# Generating keypair for EC2
resource "tls_private_key" "rsa" {
  algorithm = "RSA"
  rsa_bits  = 4096
}



resource "aws_key_pair" "tf_key" {
  key_name = "Public_ossh_Key"
  public_key = tls_private_key.rsa.public_key_openssh
}



resource "local_file" "tf_key" {
  filename = "Private_pem_Key.pem"
  content = tls_private_key.rsa.private_key_pem
  file_permission = "0600"
}