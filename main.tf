# Define AWS provider
provider "aws" {
  region = "us-east-1"  # Change as needed
}

# Generate a new SSH key pair
resource "tls_private_key" "taste_key" {
  algorithm = "RSA"
  rsa_bits  = 2048
}

# Create an AWS key pair with the name "taste"
resource "aws_key_pair" "taste" {
  key_name   = "taste"  # Key pair name in AWS
  public_key = tls_private_key.taste_key.public_key_openssh
}

# Save the private key locally
resource "local_file" "private_key" {
  content         = tls_private_key.taste_key.private_key_pem
  filename        = "${path.module}/taste.pem"
  file_permission = "0600"
}

# Create an EC2 instance using the "taste" key pair
resource "aws_instance" "my_instance" {
  ami           = "ami-0f9de6e2d2f067fca"  # Replace with your AMI ID
  instance_type = "t2.micro"
  key_name      = aws_key_pair.taste.key_name  # Use "taste" key pair

  tags = {
    Name = "MyTasteInstance"
  }
}
