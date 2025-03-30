resource "tls_private_key" "key_pair" {
  algorithm = "RSA"
  rsa_bits  = 2048
}

resource "aws_key_pair" "key_pair" {
  key_name   = var.key_name
  public_key = tls_private_key.key_pair.public_key_openssh
}

resource "local_file" "private_key" {
  content         = tls_private_key.key_pair.private_key_pem
  filename        = var.private_key_filename
  file_permission = "0600"
}
