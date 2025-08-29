output "vpc_id" {
  value       = aws_vpc.main.id
  description = "The ID of the VPC"
}

output "public_subnet_id" {
  value       = aws_subnet.public.id
  description = "The ID of the public subnet"
}

output "ecs_sg_id" {
  value       = aws_security_group.ecs_sg.id
  description = "The ID of the ECS security group"
}

output "public_subnet_cidr" {
  value = aws_subnet.public.cidr_block
  description = "CIDR block of the public subnet"
}