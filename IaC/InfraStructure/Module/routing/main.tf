# # # # # ROUTING # # # # # 

# PRIVATE ROUTING
resource "aws_route_table" "private_route_table" {
  vpc_id = var.vpc_id

  tags = {
    Name = "${var.belongs_to}-Private-Route-Table"
  }

}

resource "aws_route" "private_route" {
  route_table_id = aws_route_table.private_route_table.id
  destination_cidr_block = var.private_destination_cider
  nat_gateway_id = var.nat_gateway_id  # need nat gateway here

}

resource "aws_route_table_association" "private_association" {
  route_table_id = aws_route_table.private_route_table.id
  subnet_id = var.private_subnet_id
}

# PUBLIC ROUTING
resource "aws_route_table" "public_route_table" {
  vpc_id = var.vpc_id

  tags = {
    Name = "${var.belongs_to}-Public-Route-Table"
  }
}

resource "aws_route" "public_route" {
  route_table_id = aws_route_table.public_route_table.id
  destination_cidr_block = var.public_destination_cider   # need to axis all traffic
  gateway_id = var.ig_id
}

resource "aws_route_table_association" "public_association" {
  route_table_id = aws_route_table.public_route_table.id
  subnet_id = var.public_subnet_id

}