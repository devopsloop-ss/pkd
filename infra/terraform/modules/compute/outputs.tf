#Output master's Public IP
output "master_public_ip" {
  value = aws_instance.master.public_ip
}

#Output node's Public IP
output "node_public_ip" {
  value = aws_instance.node.public_ip
}

