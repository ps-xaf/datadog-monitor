variable "notification_recipient" {
  description = "Contact to send alerts to."
  default     = ""
}

variable "path_templates" {
  description = "Path to templates outside of the module, relative to root"
  default     = "templates"
}

variable "monitor_processes" {
  description = "A list of processes to monitor. (see also https://docs.datadoghq.com/api/?lang=bash#monitors)"
  type        = map
  default     = {}
}

variable "monitor_metrics" {
  description = "A list of base metrics."
  type        = map
  default     = {}
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

