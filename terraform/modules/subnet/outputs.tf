output "subnets_ids" {
  description = "List of subnets ids"
  value       = aws_subnet.main[*].id
}