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
