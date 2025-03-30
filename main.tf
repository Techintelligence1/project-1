# Define AWS provider
provider "aws" {
  region = var.region
}

# Key Pair Module
module "key_pair" {
  source               = "./modules/key_pair"
  key_name             = var.key_name
  private_key_filename = var.private_key_filename
}

# EC2 Module
module "ec2_instance" {
  source         = "./modules/ec2"
  ami_id         = var.ami_id
  instance_type  = var.instance_type
  key_name       = var.key_name
  instance_name  = "naTasteInstance"
}

# S3 Module
module "s3_bucket" {
  source      = "./modules/s3"
  bucket_name = var.terraform_state_bucket_name
  environment = var.environment
}
