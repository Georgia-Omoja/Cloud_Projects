resource "aws_lambda_function" "my_function" {
  function_name = "ses-lambda-function"  // Replace with desired name
  role          = aws_iam_role.lambda_role.arn  // Reference the existing role
  handler       = "index.handler"  // Specify the handler function
  runtime       = "python3.9"  // Adjust based on your code's language

  # Code source (options for uploading a zip file or using an S3 bucket)
  source_code_hash = filebase64sha256("./path/to/my/function/code.zip")  // For local zip file
  # source_code_hash = data.aws_s3_bucket_object.code_zip.body  // For S3 bucket
}