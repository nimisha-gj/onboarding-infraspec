output "instance_id" {
  description = "EC2 instance id"
  value = aws_instance.exercise_2_instance.id
}

output "network_interface_id" {
  value = aws_instance.exercise_2_instance.primary_network_interface_id
}
