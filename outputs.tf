output "instance_public_ip" {
  description = "Public IP of created EC2 instance"
  value       = aws_instance.terraform_demo.public_ip
}

output "instance_id" {
  description = "EC2 instance ID"
  value       = aws_instance.terraform_demo.id
}

