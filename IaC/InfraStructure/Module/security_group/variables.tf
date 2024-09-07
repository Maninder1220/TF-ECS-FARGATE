# VPC
variable "vpc_id" {}

# TAG
variable "belongs_to" {
   type = string
   default = "Medusa-SecurityGroup"
  }