#resource "aws_dynamodb_table" "hhtest-dev-k8s-ddb-table" {

#  depends_on   = [aws_s3_bucket.hhtest-dev-k8s-s3-bucket]
#  name         = "hhtest-dev-k8s-ddb-table"
#  billing_mode = "PAY_PER_REQUEST"
#  hash_key     = "LockID"

#  tags = {
#    "Name" = "hhtest-dev-k8s-ddb-table"
#  }

#}