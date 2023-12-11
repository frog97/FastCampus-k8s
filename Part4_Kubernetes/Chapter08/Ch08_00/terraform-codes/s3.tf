resource "aws_s3_bucket" "hhtest-dev-k8s-s3-bucket" {

  bucket = "hhtest-dev-k8s-s3-bucket"

  tags = {
    "Name" = "hhtest-dev-k8s-s3-bucket"
  }

}