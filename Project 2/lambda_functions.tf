//            SES FUNCTION               //
  // Archiving SES Function File Data Source
  data "archive_file" "ses_lambda" {
    type        = "zip"
    source_file = "SES_lambda_function.py"
    output_path = "SES_lambda_function.zip"
  }

  //SES function 
  resource "aws_lambda_function" "ses_lambda" {
    filename      = "SES_lambda_function.zip"
    function_name = "ses-lambda-function"
    role          = aws_iam_role.lambda_role.arn
    handler       = "SES_lambda_function.lambda_handler"

    source_code_hash = data.archive_file.ses_lambda.output_base64sha256

    runtime = "python3.9"

    environment {
      variables = {
        destinationEmail = "omojaglorygeorgia@gmail.com"
        message = "SES Function is running"
      }
    }
  }

  //SES function Invocation
  resource "aws_lambda_invocation" "ses_invocation" {
    function_name = aws_lambda_function.ses_lambda.function_name

    input = jsonencode({
      destinationEmail = "omojaglorygeorgia@gmail.com"
      message = "Function is running"
    })
  }


//            SNS FUNCTION               //
  // Archiving SNS Function File Data Source
  data "archive_file" "sns_lambda" {
    type        = "zip"
    source_file = "SNS_lambda_function.py"
    output_path = "SNS_lambda_function.zip"
  }

   //SNS function
  resource "aws_lambda_function" "sns_lambda" {
    filename      = "SNS_lambda_function.zip"
    function_name = "sns-lambda-function"
    role          = aws_iam_role.lambda_role.arn
    handler       = "SNS_lambda_function.lambda_handler"

    source_code_hash = data.archive_file.sns_lambda.output_base64sha256

    runtime = "python3.9"

    environment {
      variables = {
        phoneNumber = "+2348033979455"
        message = "SNS Function is running"
      }
    }
  }

  //SNS function Invocation
  resource "aws_lambda_invocation" "sns_invocation" {
    function_name = aws_lambda_function.sns_lambda.function_name

    input = jsonencode({
      phoneNumber = "+2348033979455"
      message = "SNS Function is running"
    })
  }

