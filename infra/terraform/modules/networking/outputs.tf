#Output subnet id for compute module
output "public_subnet_id" {
  value = aws_subnet.public_subnet.id
}