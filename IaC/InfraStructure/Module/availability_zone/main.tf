# AVAILABILITY ZONE

# LOCAL
locals {
  aws_availability_zones = ["ap-south-1a", "ap-south-1b"]
}



# Randomly Select AZ
resource "random_shuffle" "az" {
  input = local.aws_availability_zones
  result_count = 2    # No of Subnet = Result_Count
}