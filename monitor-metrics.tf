
resource "datadog_monitor" "metric_alert" {
  for_each = merge(var.monitor_metrics_custom, var.monitor_metrics_base)

  name    = format("Metric Monitor: %s", each.key)
  type    = "metric alert"
  query   = templatefile("${path.module}/templates/query/metrics_${each.value[0]}.tpl", { metrics = each.key, critical = each.value[2], recipient = var.notification_recipient })
  message = templatefile("${path.module}/templates/message/metrics_${each.value[1]}.tpl", { metrics = each.key, critical = each.value[2], recipient = var.notification_recipient })

  thresholds = {
    warning  = each.value[3]
    critical = each.value[2]
  }

  notify_audit      = false
  locked            = false
  timeout_h         = 0
  include_tags      = true
  new_host_delay    = 300
  notify_no_data    = true
  renotify_interval = 0
  no_data_timeframe = 15

  tags = [format("monitor_metrics:%s", replace(lower(each.key), " ", "_", ))]
}
