variable "table_name" {
  description = "The name of the DynamoDB table"
  type        = string
}

variable "hash_key" {
  description = "The name of the hash key"
  type        = string
}

variable "hash_key_type" {
  description = "The type of the hash key: S | N | B"
  type        = string
  default     = "S"
}

variable "range_key" {
  description = "The name of the range key (optional)"
  type        = string
  default     = ""
}

variable "range_key_type" {
  description = "The type of the range key: S | N | B"
  type        = string
  default     = "S"
}

variable "billing_mode" {
  description = "Billing mode: PROVISIONED or PAY_PER_REQUEST"
  type        = string
  default     = "PROVISIONED"
}

variable "read_capacity" {
  description = "Read capacity units (for PROVISIONED mode)"
  type        = number
  default     = 5
}

variable "write_capacity" {
  description = "Write capacity units (for PROVISIONED mode)"
  type        = number
  default     = 5
}

variable "global_secondary_indexes" {
  description = "List of global secondary index definitions"
  type = list(object({
    name               = string
    hash_key           = string
    range_key          = optional(string)
    projection_type    = string
    non_key_attributes = optional(list(string))
    read_capacity      = optional(number)
    write_capacity     = optional(number)
  }))
  default = []
}

variable "tags" {
  description = "Tags to apply to the DynamoDB table"
  type        = map(string)
  default     = {}
}
