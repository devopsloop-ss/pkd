#Output subnet id for compute module
output "public_subnet_id" {
  value = aws_subnet.public_subnet.id
}

#Output security group for compute module
output "open_sg_id" {
  value = aws_security_group.allow_all.id
}
