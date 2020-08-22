output "aws_external_id" {
  value = {
    for account in datadog_integration_aws.account :
    account.account_id => account.external_id
  }
}

output "custom" {
  value = module.monitors.custom_check
}

output "metric" {
  value = module.monitors.metric_alert
}
