variable "api_key" {
  description = "API Key used for datadog"
  default     = ""
}

variable "app_key" {
  description = "Datadog Application key"
  default     = ""
}

variable "api_url" {
  description = "URL to datadog API"
  default     = ""
}

variable "notification_recipient" {
  description = "Contact to send alerts to."
  default     = ""
}

variable "aws_accounts" {
  description = "List of AWS account to activate the DataDog integration"
  type        = map
  default     = {}
}

variable "path_templates" {
  description = "Path to templates outside of the module, relative to root"
  default     = "templates"
}

# Below "Process Monitors" which might require the DD agent to be installed and configured.
variable "monitor_processes" {
  description = "A list of processes to monitor. (see also https://docs.datadoghq.com/api/?lang=bash#monitors)"
  type        = map
  default     = {}
}


# Some predefined base check like CPU, mem, using the DD agent and should be deployed across all hosts out of the box.
variable "monitor_metrics" {
  description = "A list of base metrics."
  type        = map
  default = {
    # "METRICS_NAME"  = ["query_tpl_file_to_use","msg_tpl_file_to_use", "CRITICAL", "WARNING"]
    "CPU utilization (%)" = ["cpu", "default", "90", "80", ""] # CPU utilization of more than 90% triggers a critical, 80% a warning
    "Memory used (%)"     = ["mem", "default", "90", "80", ""] # Memory utilization of more than 90% triggers a critical, 80% a warning
    "Disk used (%)"       = ["disk", "default", "90", "80", ""]
    "Inodes used (%)"     = ["inodes", "default", "90", "80", ""]
    "IO utilization (%)"  = ["ioutils", "default", "90", "80", ""]
    "Load 1min"           = ["load1m", "load", "2.0", "1.75", ""]
    "Load 5min"           = ["load5m", "load", "1.75", "1.50", ""]
    "Load 15min"          = ["load15m", "load", "1.50", "1.25", ""]
  }
}

variable "monitor_custom" {
  description = "A list of custom metrics. (see also https://docs.datadoghq.com/api/?lang=bash#monitors)"
  type        = map
  default     = {}
}

variable "monitor_forecast" {
  description = "A map of forecast metrics to be monitored"
  type        = map
  default     = {}
}

variable "monitor_integration" {
  description = "A map of metrics for integration"
  type        = map
  default     = {}
}

variable "monitor_network" {
  description = "A map of metrics for network checks"
  type        = map
  default     = {}
}

variable "aws_service_namespaces" {
  default = {
    api_gateway            = false
    application_elb        = false
    appstream              = false
    appsync                = false
    athena                 = false
    auto_scaling           = false
    billing                = false
    budgeting              = false
    cloudfront             = false
    cloudhsm               = false
    cloudsearch            = false
    cloudwatch_events      = false
    cloudwatch_logs        = false
    codebuild              = false
    cognito                = false
    collect_custom_metrics = false
    connect                = false
    crawl_alarms           = false
    directconnect          = false
    dms                    = false
    documentdb             = false
    dynamodb               = false
    ebs                    = false
    ec2                    = false
    ec2api                 = false
    ec2spot                = false
    ecs                    = false
    efs                    = false
    elasticache            = false
    elasticbeanstalk       = false
    elasticinference       = false
    elastictranscoder      = false
    elb                    = false
    emr                    = false
    es                     = false
    firehose               = false
    gamelift               = false
    glue                   = false
    inspector              = false
    iot                    = false
    kinesis                = false
    kinesis_analytics      = false
    kms                    = false
    lambda                 = false
    lex                    = false
    mediaconnect           = false
    mediaconvert           = false
    mediapackage           = false
    mediatailor            = false
    ml                     = false
    mq                     = false
    msk                    = false
    nat_gateway            = false
    neptune                = false
    network_elb            = false
    opsworks               = false
    polly                  = false
    rds                    = false
    redshift               = false
    rekognition            = false
    route53                = false
    route53resolver        = false
    s3                     = false
    sagemaker              = false
    ses                    = false
    shield                 = false
    sns                    = false
    sqs                    = false
    step_functions         = false
    storage_gateway        = false
    swf                    = false
    transitgateway         = false
    translate              = false
    trusted_advisor        = false
    usage                  = false
    vpn                    = false
    waf                    = false
    wafv2                  = false
    workspaces             = false
    xray                   = false
  }
}
