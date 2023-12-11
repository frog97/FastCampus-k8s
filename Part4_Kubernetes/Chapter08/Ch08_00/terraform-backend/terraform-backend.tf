resource "aws_s3_bucket" "testhh-s3-tf-state" {

  bucket = "testhh-s3-tf-state"

  tags = {
    "Name" = "testhh-s3-tf-state"
  }
  
}

resource "aws_dynamodb_table" "testhh-ddb-tf-lock" {

  depends_on   = [aws_s3_bucket.testhh-s3-tf-state]
  name         = "testhh-ddb-tf-lock"
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }

  tags = {
    "Name" = "testhh-ddb-tf-lock"
  }

}