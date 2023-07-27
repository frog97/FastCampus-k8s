resource "aws_s3_bucket" "hh-fc-k8s4dev-s3-tf-state" {

  bucket = "hh-fc-k8s4dev-s3-tf-state"

  tags = {
    "Name" = "hh-fc-k8s4dev-s3-tf-state"
  }
  
}

resource "aws_dynamodb_table" "hh-fc-k8s4dev-ddb-tf-lock" {

  depends_on   = [aws_s3_bucket.hh-fc-k8s4dev-s3-tf-state]
  name         = "hh-fc-k8s4dev-ddb-tf-lock"
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }

  tags = {
    "Name" = "hh-fc-k8s4dev-ddb-tf-lock"
  }

}