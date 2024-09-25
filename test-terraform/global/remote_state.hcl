# remote_state {
#   backend = "s3"
#   config = {
#     bucket         = "your-terraform-state-bucket"
#     key            = "path/to/terraform.tfstate"  # path to your state file in the bucket
#     region         = "us-east-1"
#     encrypt        = true
#     dynamodb_table = "terraform-lock-table"       # Optional, for state locking
#   }
# }
#
# terraform {
#   backend "s3" {
#     bucket = "terraform-state-dev-bucket" //Name of the S3 bucket where the Terraform state will be stored.
#     key            = "${path_relative_to_include()}/terraform.tfstate"
#     // Path to the Terraform state file within the bucket. ${path_relative_to_include()} ensures each environment gets a unique state file.
#     region         = "us-east-1"
#     encrypt        = true
#     dynamodb_table = "my-lock-table"
#     // A DynamoDB table for state locking to prevent concurrent runs from corrupting the state.
#   }
# }

# remote_state {
#   backend = "s3"
#   generate = {
#     path      = "backend.tf"
#     if_exists = "overwrite_terragrunt"
#   }
#   config = {
#     bucket = "myterraform-state-dev-bucket"
#
#     key = "${path_relative_to_include()}/terraform.tfstate"
#     region         = "us-east-1"
#     encrypt        = true
#     dynamodb_table = "my-lock-table"
#   }
# }