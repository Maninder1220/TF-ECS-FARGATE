variable "vpc_id" {}

variable "private_subnet_id" {}
variable "public_subnet_id" {}



# TAG
variable "belongs_to" {
   type = string
   default = "Medusa-NACL"
  }
