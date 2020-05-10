{{#is_alert}}
${name} is not reachable from {{host.name_tag}} {{host.ip}}
${recipient}
{{/is_alert}}

{{#is_alert_recovery}}
${name} is reacable reachable from {{host.name_tag}} {{host.ip}}
${recipient}
{{/is_alert_recovery}}
