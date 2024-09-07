output "ec2_public_ip" {
  value = aws_instance.medusa_server.public_ip
}