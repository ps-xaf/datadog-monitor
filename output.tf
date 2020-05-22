output "aws_external_id" {
  value = {
    for account in datadog_integration_aws.account :
    account.account_id => account.external_id
  }
}
