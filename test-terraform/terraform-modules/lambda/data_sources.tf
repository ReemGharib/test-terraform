data "aws_iam_role" "iam_for_lambda" {
  name = format("ats-ddna-%s-ce-core-%s", var.env, "iam_for_lambda")
}