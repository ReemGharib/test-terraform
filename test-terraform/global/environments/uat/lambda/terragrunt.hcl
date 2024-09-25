# locals {
#   aws_region    = "us-west-2"
#   lambda_bucket = "my-lambda-bucket"
# }
# terraform {
#   source = "../modules/lambda"
# }
#
# inputs = {
#   aws_region        = "us-west-2"
#   lambda_name       = "my-dev-lambda"
#   lambda_handler    = "index.handler"
#   lambda_runtime    = "nodejs14.x"
#   lambda_zip_file   = "path/to/your/lambda-dev.zip"
#   s3_bucket         = "your-lambda-artifacts-bucket"
#   s3_key            = "lambda/dev/lambda-dev.zip"
# }