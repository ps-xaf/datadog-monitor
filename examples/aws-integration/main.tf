module "monitor" {
  source = "../../"

  api_key = <YOUR API KEY>
  app_key = <YOUR APP KEY>
  api_url = <URL TO API>

  notification_recipient = "@datadog"

  # See also https://docs.datadoghq.com/integrations/amazon_web_services/
  aws_accounts = {
    "<YOUR AWS ACCOUNTID>" = ["<ACCOUNT NAME>"]
  }

  monitor_custom = {
    "NTP clock drift" = ["ntp", "default", "2", "1", ""]
  }

  aws_service_namespaces = {
    application_elb        = true
    auto_scaling           = true
    billing                = true
    budgeting              = true
    cloudwatch_logs        = true
    collect_custom_metrics = true
    ebs                    = true
    ec2                    = true
    ec2api                 = true
    ec2spot                = true
    ecs                    = true
    s3                     = true
    ses                    = true
    usage                  = true
  }
}

output "aws_external_id" {
  value = module.monitor.aws_external_id
}