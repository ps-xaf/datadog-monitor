resource "datadog_monitor" "process_check" {
  for_each = var.monitor_processes

  name    = format("Process Monitor: %s", each.key)
  type    = "service check"
  query   = templatefile("${path.module}/templates/query/process_${each.value[0]}.tpl", { process_name = each.key, critical = each.value[1], recipient = var.notification_recipient })
  message = templatefile("${path.module}/templates/message/process_${each.value[1]}.tpl", { process_name = each.key, critical = each.value[1], recipient = var.notification_recipient })

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

  tags = [format("monitor_metrics:%s", replace(lower(each.key), " ", "_", ))]
}

