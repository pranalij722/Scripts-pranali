# Local Variables for IP addresses
locals {
  instance_public_ips  = aws_instance.Banking_Project_DJP_Instance[*].public_ip
  instance_private_ips = aws_instance.Banking_Project_DJP_Instance[*].private_ip
}

# Outputs for specific instance IPs
output "DJP_public_ip" {
  description = "Public IP of the first instance"
  value       = local.instance_public_ips[0]
}

output "G_public_ip" {
  description = "Public IP of the second instance"
  value       = local.instance_public_ips[1]
}

output "DJP_private_ip" {
  description = "Private IP of the first instance"
  value       = local.instance_private_ips[0]
}

output "G_private_ip" {
  description = "Private IP of the second instance"
  value       = local.instance_private_ips[1]
}
