

locals {
  zip_location = "outputs/welcome.zip"
}


data "archive_file" "init" {
  type        = "zip"
  source_file = "welcome.py"
  output_path = "${local.zip_location}"
}


resource "aws_lambda_function" "lambda-tf" {
  filename      = "${local.zip_location}"
  function_name = "hello"
  role          = aws_iam_role.lambda_role.arn
  handler       = "welcome.hello"

 # source_code_hash = filebase64sha256("${locals.zip_location}")

  runtime = "python3.7"

}