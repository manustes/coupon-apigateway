resource "aws_iam_role" "iam_for_lambda" {
  name = "iam_for_lambda"

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

resource "aws_lambda_function" "coupon_lambda" {
  function_name    = "lambda-coupon"
  filename         = "files/lambda-coupon.zip"
  source_code_hash = filebase64sha256("files/lambda-coupon.zip")
  role             = aws_iam_role.iam_for_lambda.arn
  handler          = "src/index.handler"
  runtime          = "nodejs12.x"
}

