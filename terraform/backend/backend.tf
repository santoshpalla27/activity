# Define the AWS provider and specify the region
provider "aws" {
  region = "us-east-1"
}

# Create the S3 bucket
resource "aws_s3_bucket" "nginx-activity" {
  bucket = "nginx-activity"
  tags = {
    Name = "nginx-activity"
  }
}

# Create the DynamoDB table
resource "aws_dynamodb_table" "terraform_lock" {
  name         = "terraform-lock"
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }
}


