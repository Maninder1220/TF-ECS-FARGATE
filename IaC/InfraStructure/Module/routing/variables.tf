# VPC
variable "vpc_id" {}

# Subnet
variable "private_subnet_id" {}   # PUBLIC
variable "public_subnet_id" {}    # PRIVATE

# INTERNET GATEWAY
variable "ig_id" {}

# NAT
variable "nat_gateway_id" {}


# DEstination Cidr

variable "private_destination_cider" {}  # Private
variable "public_destination_cider" {}   # Public


# TAG
variable "belongs_to" {
   type = string
   default = "Medusa-Routing"
  }