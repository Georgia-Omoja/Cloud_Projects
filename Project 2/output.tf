output "ses_result_entry" {
  value = jsondecode(aws_lambda_invocation.ses_invocation.result)
}


output "sns_result_entry" {
  value = jsondecode(aws_lambda_invocation.sns_invocation.result)
}