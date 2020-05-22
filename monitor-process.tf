resource "datadog_monitor" "process_check" {
  for_each = var.monitor_processes

  name = format("Process %s", each.key)
  type = "service check"

  query = templatefile(
    fileexists("${path.root}/${var.path_templates}/query/process_${each.value[0]}.tpl")
    ? "${path.root}/${var.path_templates}/query/process_${each.value[0]}.tpl"
    : "${path.module}/templates/query/process_${each.value[0]}.tpl",
    {
      name      = each.key,
      critical  = each.value[2],
      recipient = var.notification_recipient,
      from      = length(each.value[4]) == 0 ? "*" : join(", ", [for s in split(",", each.value[4]) : format("%q", s)])
    }
  )

  message = templatefile(
    fileexists("${path.root}/${var.path_templates}/message/process_${each.value[1]}.tpl")
    ? "${path.root}/${var.path_templates}/message/process_${each.value[1]}.tpl"
    : "${path.module}/templates/message/process_${each.value[1]}.tpl",
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

  tags = concat([format("monitor_process:%s", replace(lower(each.key), " ", "_", ))])
}

