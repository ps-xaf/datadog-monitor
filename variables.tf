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

variable "monitor_processes" {
  description = "A list of processes to monitor. (see also https://docs.datadoghq.com/api/?lang=bash#monitors)"
  type        = map
  default     = {}
}

# Base check like CPU, mem, should be deployed across all hosts out of the box and shouldn't be overwriteable.
# Use the variable "monitor_metrics_custom = {}" instead to create additional ones and then use tags on the host to filter alerts
variable "monitor_metrics_base" {
  description = "A list of base metrics."
  type        = map
  default = {
    # "METRICS_NAME"  = ["query_tpl_file_to_use","msg_tpl_file_to_use", "CRITICAL", "WARNING"]
    "CPU utilization (%)" = ["cpu", "default", "90", "80"] # CPU utilization of more than 96% triggers a critical, 80% a warning
    "Memory used (%)"     = ["mem", "default", "90", "80"] # Memory utilization of more than 96% triggers a critical, 80% a warning
    "Disk used (%)"       = ["disk", "default", "90", "80"]
    "Inodes used (%)"     = ["inodes", "default", "90", "80"]
    "IO utilization (%)"  = ["ioutils", "default", "90", "80"]
    "Load 1min"           = ["load1m", "load", "1.2", "1.0"]
    "Load 5min"           = ["load5m", "load", "1.0", "0.8"]
    "Load 15min"          = ["load15m", "load", "0.8", "0.6"]
  }
}

variable "monitor_metrics_custom" {
  description = "A list of additional metrics. !!! Key has to be named differently as monitor_metrics_base above takes precedence"
  type        = map
  default     = {}
}

variable "monitor_custom" {
  description = "A list of custom metrics. (see also https://docs.datadoghq.com/api/?lang=bash#monitors)"
  type        = map
  default     = {}
}
