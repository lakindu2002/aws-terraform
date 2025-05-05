output "table_name" {
  description = "The name of the DynamoDB table"
  value       = aws_dynamodb_table.this.name
}

output "table_arn" {
  description = "The ARN of the DynamoDB table"
  value       = aws_dynamodb_table.this.arn
}

output "hash_key" {
  description = "The hash key name"
  value       = aws_dynamodb_table.this.hash_key
}

output "range_key" {
  description = "The range key name"
  value       = try(aws_dynamodb_table.this.range_key, "")
}
