module "monitor" {
  source = "../../"

  api_key = <YOUR API KEY>
  app_key = <YOUR APP KEY>
  api_url = <URL TO API>

  notification_recipient = "@datadog"

  monitor_custom = {
    "NTP clock drift" = ["ntp", "default", "2", "1", ""]
  }
}
