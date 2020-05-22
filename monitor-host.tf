resource "datadog_monitor" "host_check" {
  name              = "Host Monitor"
  type              = "service check"
  message           = format("Host Datadog agent not responding. %s", var.notification_recipient)
  query             = "\"datadog.agent.up\".over(\"datadog_agent:true\").last(2).count_by_status()"
  notify_no_data    = true
  renotify_interval = 60

  tags = ["monitor_host:true", "monitor_process:datadog"]
}
