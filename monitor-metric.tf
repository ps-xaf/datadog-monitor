resource "datadog_monitor" "metric_alert" {
  for_each = merge(var.monitor_metrics)

  name = format("Metric %s", each.key)
  type = "metric alert"

  query = templatefile(
    fileexists("${path.root}/${var.path_templates}/query/metrics_${each.value[0]}.tpl")
    ? "${path.root}/${var.path_templates}/query/metrics_${each.value[0]}.tpl"
    : "${path.module}/templates/query/metrics_${each.value[0]}.tpl",
    {
      name      = each.key,
      critical  = each.value[2],
      recipient = var.notification_recipient,
      from      = length(each.value[4]) == 0 ? "*" : join(", ", [for s in split(",", each.value[4]) : format("%q", s)])
    }
  )

  message = templatefile(
    fileexists("${path.root}/${var.path_templates}/message/metrics_${each.value[1]}.tpl")
    ? "${path.root}/${var.path_templates}/message/metrics_${each.value[1]}.tpl"
    : "${path.module}/templates/message/metrics_${each.value[1]}.tpl",
    {
      name      = each.key,
      critical  = each.value[2],
      recipient = var.notification_recipient
    }
  )

  thresholds = {
    critical = each.value[2]
    warning  = each.value[3]
  }

  notify_audit      = false
  locked            = false
  timeout_h         = 0
  include_tags      = true
  new_host_delay    = 300
  notify_no_data    = true
  renotify_interval = 0
  no_data_timeframe = 15

  tags = concat([format("monitor_metric:%s", replace(lower(each.key), " ", "_", ))])
}
