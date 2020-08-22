output "custom_check" {
  value = {
    for check_id in datadog_monitor.custom_check :
    check_id.name => check_id.id
  }
}

output "metric_alert" {
  value = {
    for metric_id in datadog_monitor.metric_alert :
    metric_id.name => metric_id.id
  }
}
# output "forecast_alert" {}
# output "host_check" {}
# output "integration" {}
# output "network_alert" {}
# output "process_check" {}
