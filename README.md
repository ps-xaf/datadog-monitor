
# datadog-monitors

## Summary

Using templates for certain monitors has the advantage they are easy to extend and to modify. 
Whereas keeping them in terraform it would require to add additional parameters, extend the corresponding map variable and adjust parameters for templatefile functions  


## TODO:
- dashboards
- integrations
- tagging enhancements
- network checks
- ...


## Usage:
See also https://www.terraform.io/docs/providers/datadog/index.html

Set the required Datadog variables:

```
module "datadog_monitor" {
  source = "../modules/datadog_monitor"

  api_key = <DD API KEY>
  app_key = <DD APP KEY>
  api_url = <DD API URL>

  notification_recipient = "@dd-contact"

  monitor_custom = {
    "NTP clock drift" = {
      query_tpl = "ntp",
      msg_tpl   = "default",
      critical  = "2",
      warning   = "1"
    }
  }

  monitor_processes = {
    "CPU utilization (%)" = {
      query_tpl = "cpu",
      msg_tpl   = "default",
      critical  = "90",
      warning   = "80"
    },
    "Memory used (%)" = {
      query_tpl = "mem",
      msg_tpl   = "default",
      critical  = "90",
      warning   = "80"
    },
    "Disk used (%)" = {
      query_tpl = "disk",
      msg_tpl   = "default",
      critical  = "90",
      warning   = "80"
    },
    "Inodes used (%)" = {
      query_tpl = "inodes",
      msg_tpl   = "default",
      critical  = "90",
      warning   = "80"
    },
    "IO utilization (%)" = {
      query_tpl = "ioutils",
      msg_tpl   = "default",
      critical  = "90",
      warning   = "80"
    },
    "Load 1min" = {
      query_tpl = "load1m",
      msg_tpl   = "load",
      critical  = "2.0",
      warning   = "1.75"
    },
    "Load 5min" = {
      query_tpl = "load5m",
      msg_tpl   = "load",
      critical  = "1.75",
      warning   = "1.50"
    },
    "Load 15min" = {
      query_tpl = "load15m",
      msg_tpl   = "load",
      critical  = "1.50",
      warning   = "1.25"
    }
  }
}
```

## Tags

Best pratices as recommended by DD:
- https://docs.datadoghq.com/tagging/
- https://www.datadoghq.com/blog/tagging-best-practices/
- https://learn.datadoghq.com/course/index.php?categoryid=1 (search for "Tagging")

_scope tags_: e.g. environment, datacenter, application

_function tags_: e.g. service, site, role, 

_ownership tags_: e.g. team, creator, owner

_business tags_: e.g. wbs, costs center, ...


customer tags
e.g. customer_name, product


team:
- fab4
- rustyDocs
- muppets
- ...


service:
- shop
- api
- ...


profile:
- nginx
- apache2
- mysql
- mongo
- elastic
- airflow
- hadoop-tn
- hadoop-nn
- elastic_beanstalk_php
- ...


role:
- db (maria, mysql, oracle, etc)
- web (nging, apache)
- mail
- tracking
- scheduling
- processing
- management
- ops
- ..