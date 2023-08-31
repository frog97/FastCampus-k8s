resource "aws_s3_bucket" "hhtest-s3-tf-state" {

  bucket = "hhtest-s3-tf-state"

  tags = {
    "Name" = "hhtest-s3-tf-state"
  }
  
}

resource "aws_dynamodb_table" "hhtest-ddb-tf-lock" {

  depends_on   = [aws_s3_bucket.hhtest-s3-tf-state]
  name         = "hhtest-ddb-tf-lock"
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }

  tags = {
    "Name" = "hhtest-ddb-tf-lock"
  }

}