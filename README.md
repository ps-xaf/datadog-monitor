
# datadog-monitors

## Summary

Using templates for certain monitors has the advantage they are easy to extend and to modify. 
Whereas keeping them in terraform it would require to add  additional parameters, extend the corresponding map variable and adjust parameters for templatefile functions  


## TODO:
- make it more a module, than standalone
- change templating to be sourceable outside of this module
- dashboards
- integrations
- tagging enhancements
- parameterized notification target 
- network checks
- disk checks not being hardcoded
- ...


## Usage:
See also https://www.terraform.io/docs/providers/datadog/index.html

```
export DATADOG_API_KEY="<YOUR API KEY>"
export DATADOG_APP_KEY="<YOUR APP KEY>"
export DATADOG_HOST="API URL"
```


```
module "datadog_monitor" {
  source = "../modules/datadog_monitor"

  api_key = <DD API KEY>
  app_key = <DD APP KEY>
  api_url = <DD API URL>

  notification_recipient = "@dd-contact"

  monitor_custom = {
    "NTP clock drift" = ["ntp", "default", "2", "1"]
  }

  monitor_processes = {
    #  "METRICS_NAME"  = ["query_tpl_file_to_use","msg_tpl_file_to_use", "CRITICAL", "WARNING"]
    "sshd"    = ["default", "default", "1", "1"]
    "apache2" = ["default", "default", "1", "1"]
    "mysql"   = ["default", "default", "1", "1"]
    "php-fpm" = ["default", "default", "1", "1"]
    "dovecot" = ["default", "default", "1", "1"]
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