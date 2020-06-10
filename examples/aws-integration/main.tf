module "monitor" {
  source = "../../"

  api_key = <YOUR API KEY>
  app_key = <YOUR APP KEY>
  api_url = <URL TO API>

  notification_recipient = "@datadog"

  # See also https://docs.datadoghq.com/integrations/amazon_web_services/ for role setup on destination accounts
  aws_accounts = {
    "<YOUR AWS ACCOUNTID>" = {
      name = "<ACCOUNT NAME>"
    }
  }

  monitor_integration = {
    "EC2 Status check" = {
      query_tpl = "aws_ec2statuscheck4h",
      msg_tpl   = "default",
      critical  = "2",
      warning   = "1"
    },
    "EC2 CPU utilization" = {
      query_tpl = "aws_ec2cpu15m",
      msg_tpl   = "default",
      critical  = "90",
      warning   = "80"
    },
    "EC2 CPU credit balance" = {
      query_tpl = "aws_ec2cpucreditbalance1h",
      msg_tpl   = "default",
      critical  = "8",
      warning   = "16"
    }
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