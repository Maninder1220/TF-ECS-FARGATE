# # # # # ELASTIC IP # # # # #
resource "aws_eip" "eip_4_nat" {}

# # # # # NAT GATEWAY # # # # #
resource "aws_nat_gateway" "nat" {
  allocation_id = aws_eip.eip_4_nat.id
  subnet_id = var.public_subnet_id

  tags = {
    Name = "${var.belongs_to}-NAT-Gateway"
  }
}