
# Route Table
output "aws_route_public_id" {
  value = aws_route.public_route.id
}

output "aws_route_private_id" {
  value = aws_route.private_route.id
}


# Route Table ID
output "public_route_table_id" {
  value = aws_route_table.public_route_table.id
}

output "private_route_table_id" {
  value = aws_route_table.private_route_table.id
}

