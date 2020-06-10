module "monitor" {
  source = "../../"

  api_key = <YOUR API KEY>
  app_key = <YOUR APP KEY>
  api_url = <URL TO API>

  notification_recipient = "@datadog"

  monitor_custom = {
    "NTP clock drift" = {
      query_tpl = "ntp",
      msg_tpl   = "default",
      critical  = "2",
      warning   = "1"
    }
  }
}
