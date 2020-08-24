terraform {
  required_version = ">= 0.12.20"
  required_providers {
    datadog = ">= 2.7.0"
  }
}

provider "datadog" {
  api_key = var.api_key
  app_key = var.app_key
  api_url = var.api_url
}

module "monitors" {
  source = "./monitors/"

  enable_default_metrics = var.enable_default_metrics

  monitor_processes   = var.monitor_processes
  monitor_metrics     = var.monitor_metrics
  monitor_custom      = var.monitor_custom
  monitor_forecast    = var.monitor_forecast
  monitor_integration = var.monitor_integration
  monitor_network     = var.monitor_network
}

module "dashboards" {
  source = "./dashboards/"
}
