output "instance_public_ip" {
  value = aws_instance.my_instance.public_ip
}

output "private_key_path" {
  value = "${path.module}/taste2.pem"
}
