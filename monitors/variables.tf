variable "notification_recipient" {
  description = "Contact to send alerts to."
  default     = ""
}

variable "path_templates" {
  description = "Path to templates outside of the module, relative to root"
  default     = "templates"
}

variable "enable_default_metrics" {
  description = "Toggle to enable predefined default metrics"
  default     = true
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

# Some predefined base check like CPU, mem, using the DD agent and should be deployed across all hosts out of the box.
variable "monitor_metrics_default" {
  description = "A list of default base metrics."
  type        = map
  default = {
    "CPU utilization (%)" = {
      query    = "avg(last_5m):avg:system.cpu.user{*} by {host} + avg:system.cpu.guest{*} by {host} + avg:system.cpu.system{*} by {host} > 90"
      msg_tpl  = "default",
      critical = "90",
      warning  = "80"
    },
    "Memory used (%)" = {
      query    = "avg(last_5m):avg:system.mem.usable{*} by {host} / avg:system.mem.total{*} by {host} * 100  > 90"
      msg_tpl  = "default",
      critical = "90",
      warning  = "80"
    },
    "Disk used (%)" = {
      query     = "avg(last_5m):avg:system.disk.in_use{*} by {host} >= 90"
      query_tpl = "disk",
      msg_tpl   = "default",
      critical  = "90",
      warning   = "80"
    },
    "Inodes used (%)" = {
      query    = "avg(last_5m):avg:system.fs.inodes.used{*} by {host} / ( avg:system.fs.inodes.total{*} by {host} / 100 ) > 90"
      msg_tpl  = "default",
      critical = "90",
      warning  = "80"
    },
    "IO utilization (%)" = {
      query    = "avg(last_5m):avg:system.io.util{*} by {host} > 90"
      msg_tpl  = "default",
      critical = "90",
      warning  = "80"
    },
    "Load 1min" = {
      query    = "avg(last_5m):avg:system.load.norm.1{*} by {host} > 2.0"
      msg_tpl  = "load",
      critical = "2.0",
      warning  = "1.75"
    },
    "Load 5min" = {
      query    = "avg(last_5m):avg:system.load.norm.5{*} by {host} > 1.75"
      msg_tpl  = "load",
      critical = "1.75",
      warning  = "1.50"
    },
    "Load 15min" = {
      query    = "avg(last_5m):avg:system.load.norm.15{*} by {host} > 1.50"
      msg_tpl  = "load",
      critical = "1.50",
      warning  = "1.25"
    }
  }
}
