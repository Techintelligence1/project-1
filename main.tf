# Define AWS provider
provider "aws" {
  region = var.region  # Use the region variable
}

# Generate a new SSH key pair
resource "tls_private_key" "taste2_key" {
  algorithm = "RSA"
  rsa_bits  = 2048
}

# Create an AWS key pair with the name "taste2"
resource "aws_key_pair" "taste2" {
  key_name   = var.key_name  # Use the key_name variable
  public_key = tls_private_key.taste2_key.public_key_openssh
}

# Save the private key locally
resource "local_file" "private_key" {
  content         = tls_private_key.taste2_key.private_key_pem
  filename        = "${path.module}/${var.private_key_filename}"  # Use the private_key_filename variable
  file_permission = "0600"
}

# Create an EC2 instance using the "taste2" key pair
resource "aws_instance" "my_instance" {
  ami           = var.ami_id  # Use the ami_id variable
  instance_type = var.instance_type  # Use the instance_type variable
  key_name      = var.key_name  # Use the key_name variable

  tags = {
    Name = "naTasteInstance"
  }
}
