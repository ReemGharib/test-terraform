resource "aws_lambda_function" "lambda_core" {

  function_name = format("ats-ddna-%s-ce-core", var.env)
  description = "Lambda"
  role        = data.aws_iam_role.iam_for_lambda.arn
  handler                        = var.lambdaHandler // com.serverless.Handler
  runtime                        = "nodejs16.x"
  architectures                  = ["arm64"]
  tags                           = var.tags
}