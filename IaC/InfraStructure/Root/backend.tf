terraform {
  backend "s3" {
    bucket = "aws-backend-org"
    key = "terraform/state_file/Devops-User/medusa/here"
    region = "ap-south-1"
  }
}

