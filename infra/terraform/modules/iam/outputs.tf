output "master_profile" {
  value = aws_iam_instance_profile.master_profile.name
}

output "node_profile" {
  value = aws_iam_instance_profile.node_profile.name
}

