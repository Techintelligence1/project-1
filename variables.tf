# Define the AWS region
variable "region" {
  description = "The AWS region to deploy resources in"
  type        = string
  default     = "us-east-1"  # Default value, can be overridden
}

# Define the instance type for the EC2 instance
variable "instance_type" {
  description = "The instance type for the EC2 instance"
  type        = string
  default     = "t2.micro"  # Default value, can be overridden
}

# Define the AMI ID for the EC2 instance
variable "ami_id" {
  description = "The AMI ID for the EC2 instance"
  type        = string
  default = "ami-084568db4383264d4"
}

# Define the key pair name
variable "key_name" {
  description = "The name of the AWS key pair"
  type        = string
  default     = "taste2"  # Default value, can be overridden
}

# Define the filename for the private key
variable "private_key_filename" {
  description = "The filename for the private key"
  type        = string
  default     = "taste2.pem"  # Default value, can be overridden
}

# Define the S3 bucket name for Terraform state
variable "terraform_state_bucket_name" {
  description = "The name of the S3 bucket to store the Terraform state file"
  type        = string
  default     = ""  # Updated bucket name
}

# Define the key for the Terraform state file
variable "terraform_state_key" {
  description = "The path to the Terraform state file in the S3 bucket"
  type        = string
  default     = "terraform/state.tfstate"  # Default key for the state file
}

# Define the environment
variable "environment" {
  description = "The environment (dev, staging, prod)"
  type        = string
  default     = "dev"
}