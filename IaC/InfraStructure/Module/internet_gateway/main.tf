# # # # # INTERNET GATEWAY # # # # #
resource "aws_internet_gateway" "ig" {
  vpc_id = var.vpc_id

  tags = {
    Name = "${var.belongs_to}-Internet-Gateway"
  }

}