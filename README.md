
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
      query    = "avg(last_5m):avg:system.cpu.user{*} by {host} + avg:system.cpu.guest{*} by {host} + avg:system.cpu.system{*} by {host} > 90"
      msg_tpl  = "default",
      critical = "90",
      warning  = "80"
    },
    "Memory used (%)" = {
      query    = "avg(last_5m):avg:system.mem.usable{*} by {host} / avg:system.mem.total{*} by {host} * 100  > 90"
      msg_tpl  = "default",
      critical = "90",
      warning  = "80"
    },
    "Disk used (%)" = {
      query     = "avg(last_5m):avg:system.disk.in_use{*} by {host} >= 90"
      query_tpl = "disk",
      msg_tpl   = "default",
      critical  = "90",
      warning   = "80"
    },
    "Inodes used (%)" = {
      query    = "avg(last_5m):avg:system.fs.inodes.used{*} by {host} / ( avg:system.fs.inodes.total{*} by {host} / 100 ) > 90"
      msg_tpl  = "default",
      critical = "90",
      warning  = "80"
    },
    "IO utilization (%)" = {
      query    = "avg(last_5m):avg:system.io.util{*} by {host} > 90"
      msg_tpl  = "default",
      critical = "90",
      warning  = "80"
    },
    "Load 1min" = {
      query    = "avg(last_5m):avg:system.load.norm.1{*} by {host} > 2.0"
      msg_tpl  = "load",
      critical = "2.0",
      warning  = "1.75"
    },
    "Load 5min" = {
      query    = "avg(last_5m):avg:system.load.norm.5{*} by {host} > 1.75"
      msg_tpl  = "load",
      critical = "1.75",
      warning  = "1.50"
    },
    "Load 15min" = {
      query    = "avg(last_5m):avg:system.load.norm.15{*} by {host} > 1.50"
      msg_tpl  = "load",
      critical = "1.50",
      warning  = "1.25"
    }
  }
}
```


## Monitors

Datadog provides different monitor types depending on the service, use case and integration. 

### Process

To verify if a certain process is running e.g. httpd, ssh, tomcat, 
Needs to be configured also on DD agent 

### Metrics

To gather usage data about cpu, memory, disk, etc.

### Custom

### Forecast

To predict metric usage   

### Integration

To collect data from ressources / services. e.g. GCP, Azure, AWS ressources  

### Network

To monitor  regular checks from a DD agent to a destination set on agent side.

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