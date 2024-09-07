# # # # # VPC # # # # # 
resource "aws_vpc" "vpc" {
  cidr_block = var.vpc_cider_block
  instance_tenancy = "default"   # Shared tenancy model

  tags = {
    Name = "${var.belongs_to}-vpc"
  }

}
