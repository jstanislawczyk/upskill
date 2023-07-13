data "archive_file" "lambda_zip_inline" {
  type        = "zip"
  output_path = "/tmp/lambda_zip_inline.zip"

  source {
    content  = <<EOF
module.exports.handler = async (event, context, callback) => {
	const what = "world";
	const response = `Hello $${what}!`;
    console.log(response);
	callback(null, response);
};
EOF
    filename = "main.js"
  }
}

resource "aws_lambda_function" "lambda_zip_inline" {
  function_name    = "jstanislawczyk-lambda-1"
  handler          = "exports.handler"
  filename         = data.archive_file.lambda_zip_inline.output_path
  source_code_hash = data.archive_file.lambda_zip_inline.output_base64sha256
  runtime          = "nodejs16.x"
  role             = aws_iam_role.iam_for_lambda_1.arn

  tags = {
    test = var.test
  }
}

resource "aws_iam_role" "iam_for_lambda_1" {
  name = "iam_for_lambda_1"

  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "lambda.amazonaws.com"
      },
      "Effect": "Allow",
      "Sid": ""
    }
  ]
}
EOF
}
