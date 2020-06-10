resource "datadog_integration_aws" "account" {
  for_each = var.aws_accounts

  account_id                       = each.key
  role_name                        = "DatadogAWSIntegrationRole" # see https://docs.datadoghq.com/integrations/amazon_web_services/?tab=allpermissions#setup
  host_tags                        = [format("aws_account_id:%s", each.key), format("aws_account_name:%s", lookup(each.value, "name", "NoName"))]
  account_specific_namespace_rules = var.aws_service_namespaces
}
