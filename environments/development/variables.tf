variable "aws_access_key" {
  description = "AWS Access Key"
  type        = string
  sensitive = false
}

variable "aws_secret_key" {
  description = "AWS Secret Key"
  type        = string
  sensitive = true
}