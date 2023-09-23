output "instance_public_ip" {
  value = aws_lightsail_instance.samplelightsail_instance.public_ip_address
}