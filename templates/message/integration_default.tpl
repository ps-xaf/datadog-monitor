{{#is_alert}}
${name}  utilization is above ${critical}% on {{host.name_tag}} {{host.ip}}
${recipient}
{{/is_alert}}

{{#is_alert_recovery}}
${name} recovered and utilization dropped below ${critical}% on {{host.name_tag}} {{host.ip}}
${recipient}
{{/is_alert_recovery}}
