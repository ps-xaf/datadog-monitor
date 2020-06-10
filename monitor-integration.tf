resource "datadog_monitor" "integration" {
  for_each = var.monitor_integration

  name = format("Integration %s", each.key)
  type = "query alert"

  query = templatefile(
    fileexists("${path.root}/${var.path_templates}/query/integration_${lookup(each.value, "query_tpl", "default")}.tpl")
    ? "${path.root}/${var.path_templates}}/query/integration_${lookup(each.value, "query_tpl", "default")}.tpl"
    : "${path.module}/templates/query/integration_${each.value[0]}.tpl",
    {
      name      = each.key,
      critical  = lookup(each.value, "critical", "default"),
      recipient = var.notification_recipient,
      from      = lookup(each.value, "query_from", "default")
    }
  )

  message = templatefile(
    fileexists("${path.root}/${var.path_templates}/message/integration_${lookup(each.value, "msg_tpl", "default")}.tpl")
    ? "${path.root}/${var.path_templates}/message/integration_${lookup(each.value, "msg_tpl", "default")}.tpl"
    : "${path.module}/templates/message/integration_${lookup(each.value, "msg_tpl", "default")}.tpl",
    {
      name      = each.key,
      critical  = lookup(each.value, "critical", "1"),
      recipient = var.notification_recipient
    }
  )

  thresholds = {
    critical = lookup(each.value, "critical", "1")
    warning  = lookup(each.value, "warning", "")
  }

  notify_audit      = lookup(each.value, "notify_audit", "false")
  locked            = lookup(each.value, "locked", "false")
  timeout_h         = lookup(each.value, "timeout_h", "0")
  include_tags      = lookup(each.value, "include_tags", "true")
  new_host_delay    = lookup(each.value, "new_host_delay", "300")
  notify_no_data    = lookup(each.value, "notify_no_data", "true")
  renotify_interval = lookup(each.value, "renotify_interval", "0")
  no_data_timeframe = lookup(each.value, "no_data_timeframe", "15")

  tags = concat([format("monitor_integration:%s", replace(lower(each.key), " ", "_", ))])
}


