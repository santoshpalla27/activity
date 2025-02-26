terraform {
  backend "s3" {
    bucket         = "nginx-activity" 
    key            = "nginx-activity/terraform.tfstate"
    region         = "us-east-1"
    encrypt        = true
    dynamodb_table = "terraform-lock"
  }
}

