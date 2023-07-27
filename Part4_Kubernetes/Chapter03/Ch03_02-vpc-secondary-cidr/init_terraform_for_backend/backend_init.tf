# https://terraform101.inflearn.devopsart.dev/advanced/backend/

# S3 bucket for backend
resource "aws_s3_bucket" "hhtest-tfstate" {
  bucket = "hhtest-tfstate-s3"

  versioning {
    enabled = true # Prevent from deleting tfstate file
  }
}

# DynamoDB for terraform state lock
resource "aws_dynamodb_table" "hhtest-terraform_state_lock" {
  name           = "terraform-lock"
  hash_key       = "LockID"
  billing_mode   = "PAY_PER_REQUEST"

  attribute {
    name = "LockID"
    type = "S"
  }
}