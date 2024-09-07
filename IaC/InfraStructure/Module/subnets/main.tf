
# # # # # SUBNETS # # # # # 

# Private Subnet
resource "aws_subnet" "private_subnet" {
  vpc_id = var.vpc_id
  cidr_block = var.private_subnet
  availability_zone = var.random_az
  map_public_ip_on_launch = true

tags = {
    Name = "${var.belongs_to}-Private-Subnet"
  }

}

# Public Subnet
resource "aws_subnet" "public_subnet" {
  vpc_id = var.vpc_id
  cidr_block = var.public_subnet
  availability_zone = var.random_az
  map_public_ip_on_launch = true

tags = {
    Name = "${var.belongs_to}-Public-Subnet"
  }

}
