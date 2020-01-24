#Output master's Public IP
output "master_public_ip" {
  value = aws_instance.master.public_ip
}
