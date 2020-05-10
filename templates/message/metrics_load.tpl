{{#is_alert}}
${name} is above ${critical} on {{host.name_tag}} {{host.ip}}
${recipient}
{{/is_alert}}

{{#is_alert_recovery}}
${name} recovered and dropped below ${critical} on {{host.name_tag}} {{host.ip}}
${recipient}
{{/is_alert_recovery}}
