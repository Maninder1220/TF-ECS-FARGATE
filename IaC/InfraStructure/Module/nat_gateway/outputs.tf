output "eip_id" {
  value = aws_eip.eip_4_nat.id
}

output "nat_gateway_id" {
 value = aws_nat_gateway.nat.id
}