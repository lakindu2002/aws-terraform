module "db" {
  source        = "../../modules/dynamodb"
  table_name    = "sample-table"
  billing_mode  = "PAY_PER_REQUEST"
  hash_key      = "id"
  hash_key_type = "S"
  tags          = local.tags
}

