resource "aws_api_gateway_rest_api" "coupon_api" {
  name        = "API coupon"
  description = "API gateway coupon."
}

resource "aws_api_gateway_resource" "coupon_resource" {
  rest_api_id = aws_api_gateway_rest_api.coupon_api.id
  parent_id   = aws_api_gateway_rest_api.coupon_api.root_resource_id
  path_part   = "coupon"
}

resource "aws_api_gateway_method" "coupon_post" {
  rest_api_id   = aws_api_gateway_rest_api.coupon_api.id
  resource_id   = aws_api_gateway_resource.coupon_resource.id
  http_method   = "POST"
  authorization = "NONE"
}

resource "aws_api_gateway_integration" "integration_coupon" {
  rest_api_id             = aws_api_gateway_rest_api.coupon_api.id
  resource_id             = aws_api_gateway_resource.coupon_resource.id
  http_method             = aws_api_gateway_method.coupon_post.http_method
  integration_http_method = "POST"
  type                    = "AWS_PROXY"
  uri                     = aws_lambda_function.coupon_lambda.invoke_arn
}

resource "aws_lambda_permission" "apigw_lambda" {
  statement_id  = "AllowExecutionFromAPIGateway"
  action        = "lambda:InvokeFunction"
  function_name = aws_lambda_function.coupon_lambda.function_name
  principal     = "apigateway.amazonaws.com"
  source_arn    = "${aws_api_gateway_rest_api.coupon_api.execution_arn}/*/${aws_api_gateway_method.coupon_post.http_method}${aws_api_gateway_resource.coupon_resource.path}"
}

resource "aws_api_gateway_stage" "stage_coupon" {
  stage_name    = "api"
  rest_api_id   = aws_api_gateway_rest_api.coupon_api.id
  deployment_id = aws_api_gateway_deployment.deploy_coupon.id
}


resource "aws_api_gateway_deployment" "deploy_coupon" {
  depends_on  = [aws_api_gateway_integration.integration_coupon]
  rest_api_id = aws_api_gateway_rest_api.coupon_api.id
}
