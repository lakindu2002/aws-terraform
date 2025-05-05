resource "aws_dynamodb_table" "this" {
  name         = var.table_name
  billing_mode = var.billing_mode
  hash_key     = var.hash_key
  range_key    = var.range_key == "" ? null : var.range_key

  attribute {
    name = var.hash_key
    type = var.hash_key_type
  }

  dynamic "attribute" {
    for_each = var.range_key == "" ? [] : [var.range_key]
    content {
      name = range_key.value
      type = var.range_key_type
    }
  }

  dynamic "global_secondary_index" {
    for_each = var.global_secondary_indexes
    content {
      name               = global_secondary_index.value.name
      hash_key           = global_secondary_index.value.hash_key
      range_key          = lookup(global_secondary_index.value, "range_key", null)
      projection_type    = global_secondary_index.value.projection_type
      non_key_attributes = [global_secondary_index.value.non_key_attributes]
      read_capacity      = lookup(global_secondary_index.value, "read_capacity", var.read_capacity)
      write_capacity     = lookup(global_secondary_index.value, "write_capacity", var.write_capacity)
    }
  }

  read_capacity  = var.billing_mode == "PAY_PER_REQUEST" ? null : var.read_capacity
  write_capacity = var.billing_mode == "PAY_PER_REQUEST" ? null : var.write_capacity

  tags = var.tags
}
