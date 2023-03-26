# Create backend s3
resource "aws_s3_bucket" "oapacpujp-backend" {
  bucket = "oapacpujp-backend"
  force_destroy = true
  tags = {
    Name        = "OAPACPUJP-backend"
  }
}

# Creating the backend S3 Bucket acl
resource "aws_s3_bucket_acl" "oapacpujp-acl-s3" {
  bucket = aws_s3_bucket.oapacpujp-backend.id
  acl    = "private"
}

# DynamoDB Table
resource "aws_dynamodb_table" "tflock" {
  name           = "OAPACPUJP_dynamo_table"
  
  read_capacity  = 1
  write_capacity = 1
  hash_key       = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }
     tags = {
    Name        = "TF State Lock"
    Environment = "terraform"
  }
}
